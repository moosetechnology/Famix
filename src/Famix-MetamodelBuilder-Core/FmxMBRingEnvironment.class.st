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
	(AITopologicalSorting sort: changesToApply followingIncomingProperty: [ :change | dependencies at: change ]) do: #apply.
	changesToApply := OrderedCollection new
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicGroupSuperclass [

	^ self ringEnvironment ensureClassNamed: #MooseSpecializedGroup
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

	| classesToGenerate |
	classesToGenerate := (self changesOfType: FmxBehavioralAddition) collectAsSet: #name.

	classesToGenerate do: [ :className |
			self class environment at: className asSymbol ifPresent: [ :realClass |
					self recordMethodRemovalsOf: realClass.
					self recordMethodRemovalsOf: realClass class ] ].

	self recordRemovalOfGeneratedPackagesAndClasses.

	"Reject changes that would not change anything on the current system."
	changesToApply := changesToApply select: [ :change | change isRequired ]
]

{ #category : 'installing' }
FmxMBRingEnvironment >> createClassNamed: className superclass: superclassName traitDefinitions: traitDefinitions precedingTrait: precedingTrait properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| slots existingClass realClass packageName tag change |
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

	change := FmxClassAddition new.
	change
		name: className;
		superclass: superclassName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].

	change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass).
	changesToApply add: change.

	self ensurePackageNamed: packageName.

	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: className comment: comment) ]
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> createTraitNamed: traitName traitDefinitions: traitDefinitions precedingTrait: precedingTrait properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| packageName tag realClass slots change |
	realClass := self class environment at: traitName ifAbsent: [ nil ].

	packageName := realClass
		               ifNil: [ defaultPackage ]
		               ifNotNil: [ realClass package name ].
	tag := realClass
		       ifNil: [ defaultTag ]
		       ifNotNil: [ realClass packageTag name ].

	self validateProperties: properties.
	slots := properties collect: [ :property | property asRGSlot ].

	change := FmxTraitAddition new.
	change
		name: traitName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].

	properties ifNotEmpty: [ change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass) ].
	changesToApply add: change.

	self ensurePackageNamed: packageName.

	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: traitName comment: comment) ]
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
FmxMBRingEnvironment >> recordMethodRemovalsOf: realClass [

	| generatedMethodsOfRealClass generatedMethodNamesOfRealClass selectorsToGenerate |
	generatedMethodsOfRealClass := (Pragma allNamed: #generated in: realClass)
		                               collect: #method
		                               thenReject: [ :m | m isFromTrait ].

	generatedMethodNamesOfRealClass := generatedMethodsOfRealClass collect: #selector.

	selectorsToGenerate := ((self changesOfType: FmxMethodAddition) select: [ :change |
		                        change className = realClass instanceSide name and: [ change isClassSide = realClass isClassSide ] ]) collect: #selector.

	"First we removed the generated methods should not be here anymore"
	(generatedMethodNamesOfRealClass difference: selectorsToGenerate) ifNotEmpty: [ :selectorsOfRemovedGeneratedMethod |
		changesToApply add: (FmxMethodRemovals className: realClass name isClassSide: realClass isClassSide selectors: selectorsOfRemovedGeneratedMethod) ]
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

{ #category : 'accessing' }
FmxMBRingEnvironment >> recordRemovalOfGeneratedPackagesAndClasses [
	"Since the last generation it is possible some behaviorals were removed from the generator. In that case we should remove them. We will remove all classes and traits of Famix that are not part of the current generator."

	| classesToGenerate |
	classesToGenerate := (self changesOfType: FmxBehavioralAddition) collectAsSet: #name.

	(self changesOfType: FmxPackageAddition)
		collect: #systemPackage
		thenDo: [ :package |
				package ifNotNil: [
						package definedClasses
							select: #isMetamodelEntity
							thenDo: [ :class | (classesToGenerate includes: class name) ifFalse: [ changesToApply add: (FmxClassRemoval class: class) ] ] ] ]
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
