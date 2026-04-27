Class {
	#name : 'FmxMBRingEnvironment',
	#superclass : 'Object',
	#instVars : [
		'changesToApply',
		'ringEnvironment',
		'builder'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'instance creation' }
FmxMBRingEnvironment class >> for: aBuilder [

	^ self new 
		builder: aBuilder;
		yourself.
]

{ #category : 'installing' }
FmxMBRingEnvironment >> addMethod: sourceCode in: aClassName classSide: aBoolean protocol: protocol [

	changesToApply add: (FmxMethodAddition
			 className: aClassName
			 isClassSide: aBoolean
			 sourceCode: sourceCode
			 protocol: protocol)
]

{ #category : 'installing' }
FmxMBRingEnvironment >> apply [

	| dependencies |
	self collectChangesToApply.

	"Now we have a list of changes to apply. Some changes needs to by applied before others (for example, we need to create a classe to compile its methods or compile superclasses before their subclasses or traits before their users)."
	dependencies := changesToApply inject: Dictionary new into: [ :dictionary :change |
			                dictionary
				                at: change put: (change followingChangesIn: (changesToApply copyWithout: change));
				                yourself ].
	(changesToApply select: [ :c | c isKindOf: FmxBehavioralAddition ]) groupedBy: #name.
	(AITopologicalSorting sort: changesToApply followingIncomingProperty: [ :change | dependencies at: change ]) do: #apply
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicGroupSuperclass [

	^ self ringEnvironment ensureClassNamed: #MooseSpecializedGroup
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicImportingContextSuperclass [

	^ self ringEnvironment ensureClassNamed: #FamixImportingContext
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicModelSuperclass [

	^ self ringEnvironment ensureClassNamed: #MooseModel
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicSuperclass [

	^ self ringEnvironment ensureClassNamed: #MooseEntity
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicTrait [

	^ self ringEnvironment ensureClassNamed: #Trait
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> buildSlotsDefinitionsFor: properties existingClass: currentClass [

	| modelSlotDefinitions |
	currentClass
		ifNil: [ modelSlotDefinitions := properties collect: [ :property | property slotDefinition ] ]
		ifNotNil: [
				| currentCustomSlots |
				currentCustomSlots := currentClass localSlots copyWithoutAll: currentClass generatedSlots.

				(currentClass generatedSlots reject: [ :generatedSlot | properties anySatisfy: [ :property | property name = generatedSlot name ] ]) ifNotEmpty: [
					:slotRemovals | changesToApply add: (FmxSlotRemovals slots: slotRemovals) ].

				modelSlotDefinitions := properties
					                        reject: [ :property | currentCustomSlots anySatisfy: [ :slot | slot name = property name ] ]
					                        thenCollect: [ :property | property slotDefinition ].

				modelSlotDefinitions addAll: (currentCustomSlots collect: #definitionString) ].

	modelSlotDefinitions ifEmpty: [ ^ nil ].
	^ modelSlotDefinitions sorted
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> builder [
	^ builder
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> builder: anObject [
	builder := anObject
]

{ #category : 'cleaning' }
FmxMBRingEnvironment >> changesOfType: aClass [

	^ changesToApply select: [ :change | change isKindOf: aClass ]
]

{ #category : 'testing' }
FmxMBRingEnvironment >> changesToApply [
	"Return the list of changes to apply if a regeneration would cause changes in the system."

	self collectChangesToApply.
	^ changesToApply
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> classNamed: aClassName [

	^ self ringEnvironment ask behaviorNamed: aClassName
]

{ #category : 'installing' }
FmxMBRingEnvironment >> collectChangesToApply [
	| resolvedClasses |
	resolvedClasses := ringEnvironment ask behaviors select: [ :each | each isRingResolved and: [ each superclass isRingResolved ] ].

	resolvedClasses do: [ :each | self recordClassChangesFor: each ].
	self recordRemovalOfGeneratedEntitiesNotPresentIn: resolvedClasses.

	"Reject changes that would not change anything on the current system."
	changesToApply := changesToApply select: [ :change | change isRequired ].
]

{ #category : 'installing' }
FmxMBRingEnvironment >> compile: aSource in: aClass classified: aProtocol [

	aClass compile: aSource classified: aProtocol.
]

{ #category : 'installing' }
FmxMBRingEnvironment >> compile: aSource in: aClass classified: aProtocol package: aPackageName [

	| category |
	category := '*' , aPackageName.
	aProtocol ifNotEmpty: [ category := category , '-' , aProtocol ].
	aClass compile: aSource classified: category
]

{ #category : 'installing' }
FmxMBRingEnvironment >> createClassNamed: className superclass: superclassName traitDefinitions: traitDefinitions traitNames: traitNames precedingTrait: precedingTrait properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| slots aClass existingClass composition realClass packageName tag change |
	existingClass := self ringEnvironment ask behaviorNamed: className.

	realClass := self class environment at: className ifAbsent: [ nil ].

	packageName := realClass
		               ifNil: [ defaultPackage ]
		               ifNotNil: [ realClass package name ].
	tag := realClass
		       ifNil: [ defaultTag ]
		       ifNotNil: [ realClass packageTag name ].

	self validateProperties: properties.
	slots := properties collect: [ :property | property asRGSlot ].


	"==========================="
	change := FmxClassAddition new.
	change
		name: className;
		superclass: superclassName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].

	change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass).
	changesToApply add: change.
	"==========================="

	aClass := self ringEnvironment ensureClassNamed: className.
	aClass superclass: (self ringEnvironment ensureClassNamed: superclassName).

	composition := RGTraitComposition parent: aClass.
	aClass traitComposition: composition.

	traitNames do: [ :each | composition addTransformation: (self ringEnvironment ensureTraitNamed: each) ].

	self flag: #todo. "Should not make it in dev branch of Moose. The ring package creation should be removed."
	self ensurePackageNamed: packageName.
	aClass package: (self ringEnvironment ensurePackageNamed: packageName).
	aClass layout makeResolved.

	slots do: [ :slotInBadEnvironment |
			| slot |
			slot := slotInBadEnvironment needsFullDefinition
				        ifTrue: [
						        (RGUnknownSlot named: slotInBadEnvironment name parent: aClass layout)
							        expression: slotInBadEnvironment expression;
							        yourself ]
				        ifFalse: [ RGInstanceVariableSlot named: slotInBadEnvironment name parent: aClass layout ].
			aClass layout addSlot: slot.
			slot propertyNamed: #isGenerated put: true ].

	aClass tagWith: tag.
	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: className comment: comment) ].

	^ aClass
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> createTraitNamed: traitName  traitDefinitions: traitDefinitions uses: traitNames precedingTrait: precedingTrait  properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| aTrait existingRGClass composition packageName tag realClass slots change |
	existingRGClass := self ringEnvironment ask behaviorNamed: traitName asSymbol.

	realClass := self class environment at: traitName ifAbsent: [ nil ].

	packageName := realClass
		               ifNil: [ defaultPackage ]
		               ifNotNil: [ realClass package name ].
	tag := realClass
		       ifNil: [ defaultTag ]
		       ifNotNil: [ realClass packageTag name ].

	self validateProperties: properties.
	slots := properties collect: [ :property | property asRGSlot ].

	"==========================="
	change := FmxTraitAddition new.
	change
		name: traitName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].
	
	properties ifNotEmpty: [ change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass) ].
	changesToApply add: change.
	"==========================="

	aTrait := self ringEnvironment ensureTraitNamed: traitName.
	aTrait superclass: self basicTrait.

	composition := RGTraitComposition parent: aTrait.
	aTrait traitComposition: composition.

	traitNames do: [ :each | composition addTransformation: (self ringEnvironment ensureTraitNamed: each) ].

	self flag: #todo. "Should not make it in dev branch of Moose. The ring package creation should be removed."
	self ensurePackageNamed: packageName.
	aTrait package: (self ringEnvironment ensurePackageNamed: packageName).
	aTrait layout makeResolved.

	slots do: [ :slotInBadEnvironment |
			| slot |
			slot := slotInBadEnvironment needsFullDefinition
				        ifTrue: [
						        (RGUnknownSlot named: slotInBadEnvironment name parent: aTrait layout)
							        expression: slotInBadEnvironment expression;
							        yourself ]
				        ifFalse: [ RGInstanceVariableSlot named: slotInBadEnvironment name parent: aTrait layout ].
			aTrait layout addSlot: slot.
			slot propertyNamed: #isGenerated put: true ].

	aTrait tagWith: tag.
	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: traitName comment: comment) ].

	^ aTrait
]

{ #category : 'private' }
FmxMBRingEnvironment >> ensurePackageNamed: packageName [

	((self changesOfType: FmxPackageAddition) anySatisfy: [ :change | change packageName = packageName ]) ifTrue: [ ^ self ].

	changesToApply add: (FmxPackageAddition named: packageName)
]

{ #category : 'testing' }
FmxMBRingEnvironment >> hasBehaviorNamed: aClassName [

	^ self ringEnvironment ask includesClassNamed: aClassName
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> initialize [

	super initialize.
	changesToApply := OrderedCollection new.
	ringEnvironment := RGEnvironment new.
	ringEnvironment version: 7.
	ringEnvironment ensureClassNamed: #FMOne.
	ringEnvironment ensureClassNamed: #FMMany.		
	ringEnvironment ensureClassNamed: #FMMultivalueLink.
	ringEnvironment ensureClassNamed: #FMMultiMultivalueLink.
	ringEnvironment ensureClassNamed: #MooseSpecializedGroup.
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordClassChangesFor: aRGClass [

	| realClass |
	self flag: #todo. "Kill ring."
	realClass := self class environment classNamed: aRGClass name.
	self recordMethodsAdoptionsOf: realClass to: aRGClass realClassName: aRGClass name.
	self recordMethodsAdoptionsOf: (realClass ifNotNil: [ realClass class ]) to: aRGClass classSide realClassName: aRGClass name
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordMethodsAdoptionsOf: realClass to: anRGClass realClassName: aClassName [
	| generatedMethodsOfRealClass generatedMethodNamesOfRealClass |
	generatedMethodsOfRealClass := realClass
		ifNil: [ {} ]
		ifNotNil: [ (Pragma allNamed: #generated in: realClass) collect: #method thenReject: [ :m | m isFromTrait  ] ] .

	generatedMethodNamesOfRealClass := generatedMethodsOfRealClass collect: #selector.

	"First we removed the generated methods should not be here anymore"
	(generatedMethodNamesOfRealClass difference: anRGClass localSelectors)
		ifNotEmpty: [ :selectorsOfRemovedGeneratedMethod | changesToApply add: (FmxMethodRemovals className: aClassName isClassSide: anRGClass isClassSide selectors: selectorsOfRemovedGeneratedMethod) ].

	"Add new generated methods"
	((anRGClass localSelectors difference: generatedMethodNamesOfRealClass)
		select: [ :selectorOfMethodToAdd | realClass ifNil: [ true ] ifNotNil: [ (realClass localSelectors includes: selectorOfMethodToAdd) not ] ]
		thenCollect: [ :selectorOfMethodToAdd | anRGClass methodNamed: selectorOfMethodToAdd ])
		ifNotEmpty: [ :methods | methods do: [ :method | self addMethod: method sourceCode in: aClassName classSide: anRGClass isClassSide protocol: method protocol ] ].

	"Finally, update methods needing updates"
	((generatedMethodNamesOfRealClass intersection: anRGClass localSelectors)
		collect: [ :selectorOfMethodToUpdate | anRGClass methodNamed: selectorOfMethodToUpdate ]
		thenSelect: [ :method | realClass needToAdaptToMethod: method ])
		ifNotEmpty: [ :methods | methods do: [ :method | self addMethod: method sourceCode in: aClassName classSide: anRGClass isClassSide protocol: method protocol ] ]
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> recordRemovalOfGeneratedEntitiesNotPresentIn: resolvedClasses [
	"Since the last generation it is possible some behaviorals were removed from the generator. In that case we should remove them. We will remove all classes and traits of Famix that are not part of the current generator."

	(self changesOfType: FmxPackageAddition)
		collect: #systemPackage
		thenDo: [ :package |
				package ifNotNil: [
						package definedClasses
							select: #isMetamodelEntity
							thenDo: [ :class |
									resolvedClasses
										detect: [ :rgClass | rgClass name = class name ]
										ifNone: [ changesToApply add: (FmxClassRemoval class: class) ] ] ] ]
]

{ #category : 'public registration' }
FmxMBRingEnvironment >> registerPackage: aPackageName [

	^ self ringEnvironment ensurePackageNamed: aPackageName.

]

{ #category : 'accessing' }
FmxMBRingEnvironment >> ringEnvironment [
	^ ringEnvironment
]

{ #category : 'installing' }
FmxMBRingEnvironment >> traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass [
	"We need to collect the generated traits + the custom traits added by the user."

	| customTraitNames traitCompositionString |
	customTraitNames := ((realClass
		                      ifNil: [ #(  ) ]
		                      ifNotNil: [ :class | class traitComposition rootMembers ]) select: [ :e | realClass customTraitNames includes: e name ]) collect:
		                    #traitCompositionExpression.
	"manage methods to remove."
	traitCompositionString := traitDefinitions , customTraitNames ifEmpty: [ ^ '{ }' ] ifNotEmpty: [ :definitions | definitions joinUsing: ' + ' ].

	precedingTrait ifNil: [ ^ traitCompositionString ].

	^ String streamContents: [ :s |
			  s
				  nextPutAll: '(';
				  nextPutAll: traitCompositionString;
				  nextPutAll: ' withPrecedenceOf: ';
				  nextPutAll: precedingTrait;
				  nextPutAll: ')' ]
]

{ #category : 'installing' }
FmxMBRingEnvironment >> validateProperties: properties [

	| names |
	names := properties collect: #name.
	self assert: names size = names asSet size description: 'Two properties of the same class cannot have the same names.'.
	properties do: [ :property | property validate ]
]
