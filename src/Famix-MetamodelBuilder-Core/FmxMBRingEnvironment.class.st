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

{ #category : 'adding' }
FmxMBRingEnvironment >> addMethod: sourceCode in: aClassName classSide: aBoolean protocol: protocol [

	changesToApply add: (FmxMethodAddition
			 className: aClassName
			 isClassSide: aBoolean
			 sourceCode: sourceCode
			 protocol: protocol)
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> apply [

	| dependencies |
	self collectChangesToApply.

	"Now we have a list of changes to apply. Some changes needs to by applied before others (for example, we need to create a classe to compile its methods or compile superclasses before their subclasses or traits before their users)."
	dependencies := changesToApply inject: Dictionary new into: [ :dictionary :change |
			                dictionary
				                at: change put: (change followingChangesIn: (changesToApply copyWithout: change));
				                yourself ].
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

{ #category : 'accessing' }
FmxMBRingEnvironment >> builder [
	^ builder
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> builder: anObject [
	builder := anObject
]

{ #category : 'testing' }
FmxMBRingEnvironment >> changesToApply [
	"Return the list of changes to apply if a regeneration would cause changes in the system."

	self collectChangesToApply.
	^ changesToApply
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> classNamed: aClassName [

	^ self ringEnvironment ask behaviorNamed: aClassName
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> collectChangesToApply [
	| resolvedClasses resolvedPackages |
	changesToApply := OrderedCollection new.
	resolvedPackages := ringEnvironment ask packages select: [ :each | each isRingResolved ].
	resolvedClasses := ringEnvironment ask behaviors select: [ :each | each isRingResolved and: [ each superclass isRingResolved ] ].

	self recordPackagesChangesFor: resolvedPackages.
	self recordClassesChangesFor: resolvedClasses.
	self recordRemovalOfGeneratedEntitiesIn: resolvedPackages notPresentIn: resolvedClasses
]

{ #category : 'accessing' }
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

{ #category : 'initialization' }
FmxMBRingEnvironment >> createClassNamed: aClassName superclass: aSuperclass traitNames: traitNames slots: slots in: packageName tag: tag comment: comment [

	| aClass existingClass composition |
	existingClass := self ringEnvironment ask behaviorNamed:
		                 aClassName asSymbol.

	aClass := self ringEnvironment ensureClassNamed: aClassName.
	aClass superclass:
		(self ringEnvironment ensureClassNamed: aSuperclass name).

	composition := RGTraitComposition parent: aClass.
	aClass traitComposition: composition.

	traitNames do: [ :each | 
		composition addTransformation:
			(self ringEnvironment ensureTraitNamed: each) ].

	aClass package:
		(self ringEnvironment ensurePackageNamed: packageName).
	aClass layout makeResolved.

	slots do: [ :slotInBadEnvironment | 
		| slot |
		slot := slotInBadEnvironment needsFullDefinition
			        ifTrue: [ 
				        (RGUnknownSlot
					         named: slotInBadEnvironment name
					         parent: aClass layout)
					        expression: slotInBadEnvironment expression;
					        yourself ]
			        ifFalse: [ 
				        RGInstanceVariableSlot
					        named: slotInBadEnvironment name
					        parent: aClass layout ].
		aClass layout addSlot: slot.
		slot propertyNamed: #isGenerated put: true ].
	
	aClass tagWith: tag.
	comment ifNotEmpty: [ aClass comment content: comment ].

	^ aClass
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> createTraitNamed: traitName uses: traitNames slots: slots in: packageName tag: tag comment: comment [

	| aPackage aTrait existingClass composition |
	existingClass := self ringEnvironment ask behaviorNamed: traitName asSymbol.

	aPackage := self ringEnvironment ensurePackageNamed: packageName.

	aTrait := ringEnvironment ensureTraitNamed: traitName.
	aTrait superclass: self basicTrait.

	composition := RGTraitComposition parent: aTrait.
	aTrait traitComposition: composition.

	traitNames do: [ :each | 
		composition addTransformation:
			(self ringEnvironment ensureTraitNamed: each) ].

	aTrait package: aPackage.
	aTrait layout makeResolved.

	slots do: [ :slotInBadEnvironment | 
		| slot |
		slot := slotInBadEnvironment needsFullDefinition
			        ifTrue: [ 
				        (RGUnknownSlot
					         named: slotInBadEnvironment name
					         parent: aTrait layout)
					        expression: slotInBadEnvironment expression;
					        yourself ]
			        ifFalse: [ 
				        RGInstanceVariableSlot
					        named: slotInBadEnvironment name
					        parent: aTrait layout ].
		aTrait layout addSlot: slot.
		slot propertyNamed: #isGenerated put: true ].
	
	aTrait tagWith: tag.
	comment ifNotEmpty: [ aTrait comment content: comment ].

	^ aTrait
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> hasBehaviorNamed: aClassName [

	^ self ringEnvironment ask includesClassNamed: aClassName
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> initialize [

	super initialize.
	
	ringEnvironment := RGEnvironment new.
	ringEnvironment version: 7.
	ringEnvironment ensureClassNamed: #FMOne.
	ringEnvironment ensureClassNamed: #FMMany.		
	ringEnvironment ensureClassNamed: #FMMultivalueLink.
	ringEnvironment ensureClassNamed: #FMMultiMultivalueLink.
	ringEnvironment ensureClassNamed: #MooseSpecializedGroup.
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordAdoptionOfClassDefinitionFrom: currentClass to: anRGClassModel [

	| currentCustomSlots currentCustomSlotNames modelSlotDefinitions currentGeneratedSlots modelGeneratedSlots slotRemovals |
	(currentClass needToAdaptTo: anRGClassModel) ifFalse: [ ^ self ].

	"We are updating a class installed in the system (currentClass) to a new representation defined in the model (anRGClass).
	This has to be done in order to allow updating the class at run time"

	currentGeneratedSlots := currentClass generatedSlots.
	currentCustomSlots := currentClass localSlots copyWithoutAll:
		                      currentGeneratedSlots.
	currentCustomSlotNames := currentCustomSlots collect: #name.

	modelGeneratedSlots := anRGClassModel slots reject: [ :each |
		                       currentCustomSlotNames includes: each name ].

	modelSlotDefinitions := (modelGeneratedSlots collect:
		                         #definitionString) asOrderedCollection.
	modelSlotDefinitions addAll:
		(currentCustomSlots collect: #definitionString).
	modelSlotDefinitions := modelSlotDefinitions sorted.

	slotRemovals := currentGeneratedSlots reject: [ :e |
		                modelGeneratedSlots anySatisfy: [ :current |
			                current name = e name ] ].

	slotRemovals ifNotEmpty: [
		changesToApply add: (FmxSlotRemovals slots: slotRemovals) ].

	self
		recordClassAdditionFromClass: anRGClassModel
		traits: (self traitStringFrom: currentClass to: anRGClassModel)
		slots: '{' , (modelSlotDefinitions joinUsing: '. ') , '}'
		package: currentClass package name
		tag: currentClass packageTag name
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordClassAdditionFromClass: aRGClass traits: traitsString slots: slotsString package: packageName tag: tagName [

	| change |
	change := aRGClass isTrait
		          ifTrue: [ FmxTraitAddition new ]
		          ifFalse: [
				          FmxClassAddition new
					          superclass: aRGClass superclass name;
					          yourself ].

	change
		name: aRGClass name;
		traits: traitsString;
		slots: slotsString;
		package: packageName;
		tag: tagName.

	changesToApply add: change
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordClassChangesFor: aRGClass [

	| realClass |
	realClass := self class environment classNamed: aRGClass name.
	realClass
		ifNil: [
				self
					recordClassAdditionFromClass: aRGClass
					traits: (aRGClass traits ifEmpty: [ nil ] ifNotEmpty: [ aRGClass traitCompositionString ])
					slots: (aRGClass slots ifEmpty: [ nil ] ifNotEmpty: [ aRGClass slotDefinitionString ])
					package: aRGClass package name
					tag: aRGClass tags anyOne ]
		ifNotNil: [ self recordAdoptionOfClassDefinitionFrom: realClass to: aRGClass ].
	self recordClassCommentChangeOf: realClass to: aRGClass.
	self recordMethodsAdoptionsOf: realClass to: aRGClass realClassName: aRGClass name.
	self recordMethodsAdoptionsOf: (realClass ifNotNil: [ realClass class ]) to: aRGClass classSide realClassName: aRGClass name
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordClassCommentChangeOf: realClass to: anRGClass [

	| newComment |
	newComment := anRGClass comment content.
	(realClass isNotNil and: [ newComment = realClass comment ]) ifTrue: [ ^ self ].

	newComment isEmptyOrNil ifFalse: [ changesToApply add: (FmxClassCommentUpdate className: anRGClass name comment: newComment) ]
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordClassesChangesFor: resolvedClasses [

	resolvedClasses ifEmpty: [ ^ self ].

	resolvedClasses do: [ :each | self recordClassChangesFor: each ]
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
		ifNotEmpty: [ :methods |methods do: [ :method | self addMethod: method sourceCode in: aClassName classSide: anRGClass isClassSide protocol: method protocol ] ]
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordPackagesChangesFor: resolvedPackages [

	resolvedPackages
		reject: [ :each | self packageOrganizer hasPackage: each name ]
		thenDo: [ :each | changesToApply add: (FmxPackageAddition named: each name) ]
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> recordRemovalOfGeneratedEntitiesIn: resolvedPackages notPresentIn: resolvedClasses [
	"Since the last generation it is possible some behaviorals were removed from the generator. In that case we should remove them. We will remove all classes and traits of Famix that are not part of the current generator."

	resolvedPackages
		collect: [ :e | e name asPackageIfAbsent: [ nil ] ]
		thenDo: [ :package | 
			package
				ifNotNil:
					[ package definedClasses select: #isMetamodelEntity thenDo: [ :class | resolvedClasses detect: [ :rgClass | rgClass name = class name ] ifNone: [ changesToApply add: (FmxClassRemoval class: class) ] ] ] ]
]

{ #category : 'public registration' }
FmxMBRingEnvironment >> registerPackage: aPackageName [

	^ self ringEnvironment ensurePackageNamed: aPackageName.

]

{ #category : 'accessing' }
FmxMBRingEnvironment >> ringEnvironment [
	^ ringEnvironment
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> slotNamed: slotName [
	^ (RGUnknownSlot named: slotName asSymbol) expression: #FMProperty
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> slotNamed: slotName cardinality: cardinality type: type opposite: oppositeName [

	| cardinalityClassName |
	
	cardinalityClassName := cardinality = #one
		ifTrue: [ #FMOne ]
		ifFalse: [ #FMMany ].
		
	^ (RGUnknownSlot named: slotName asSymbol)
		 expression: ('{1} type: #{2} opposite: #{3}' 
			format: { cardinalityClassName. type. oppositeName}) 
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> slotNamed: slotName defaultValue: aValue [

	aValue ifNil: [ ^ self slotNamed: slotName ].
	^ (RGUnknownSlot named: slotName asSymbol) expression:
		  ('FMProperty defaultValue: {1}' format: { aValue printString })
]

{ #category : 'installing' }
FmxMBRingEnvironment >> traitStringFrom: realClass to: aRGClass [

	"We need to collect the generated traits + the custom traits added by the user."

	| customTraitNames traitsDefinitions traitCompositionString precedingTrait |
	customTraitNames := (realClass traitComposition rootMembers select: [ 
		                     :e | 
		                     realClass customTraitNames includes: e name ]) 
		                    collect: #traitCompositionExpression.
	traitsDefinitions := aRGClass traitsDefinitions
		                     ifEmpty: [ {  } ]
		                     ifNotEmpty: [ :rgDefinitions | 
			                     { rgDefinitions anyOne }
			                     ,
			                     (rgDefinitions allButFirst collect: [ :e | 
				                      '(' , e , ')' ]) ].
	traitsDefinitions := traitsDefinitions , customTraitNames.

	traitCompositionString := traitsDefinitions
		                          ifEmpty: [ ^ '{ }' ]
		                          ifNotEmpty: [ 
		                          traitsDefinitions joinUsing: ' + ' ].

	precedingTrait := aRGClass
		                  propertyNamed: #precedingTrait
		                  ifAbsent: [ ^ traitCompositionString ].

	^ String streamContents: [ :s | 
		  s
			  nextPutAll: '(( ';
			  nextPutAll: traitCompositionString;
			  nextPutAll: ' ) withPrecedenceOf: ';
			  nextPutAll: precedingTrait;
			  nextPutAll: ' )' ]
]
