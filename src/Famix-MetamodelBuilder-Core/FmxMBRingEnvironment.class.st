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

	self collectChangesToApply.
	"Sort the changes before applying them"
	
	(changesToApply sorted: #priority ascending) do: [ :change | change apply ]
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
	| resolvedClasses resolvedPackages |
	resolvedPackages := ringEnvironment ask packages select: [ :each | each isRingResolved ].
	resolvedClasses := ringEnvironment ask behaviors select: [ :each | each isRingResolved and: [ each superclass isRingResolved ] ].

	self recordClassesChangesFor: resolvedClasses.
	self recordRemovalOfGeneratedEntitiesIn: resolvedPackages notPresentIn: resolvedClasses.

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

{ #category : 'as yet unclassified' }
FmxMBRingEnvironment >> createClassNamed: className superclass: superclassName traitNames: traitNames slots: slots in: packageName [

	| aClass existingClass composition |
	existingClass := self ringEnvironment ask behaviorNamed: className.

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

	^ aClass
]

{ #category : 'as yet unclassified' }
FmxMBRingEnvironment >> createTraitNamed: traitName uses: traitNames slots: slots in: packageName [

	| aPackage aTrait existingClass composition |
	existingClass := self ringEnvironment ask behaviorNamed:
		                 traitName asSymbol.

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
		classSlots:
			'{' , ((currentClass class localSlots collect: #definitionString)
				 joinUsing: ' . ') , '}'
		sharedVariables:
			'{'
			, ((currentClass classVarNames collect: [ :each | '#' , each ])
					 joinUsing: ' ') , '}'
		package: currentClass package name
		tag: currentClass packageTag name
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordClassAdditionFromClass: aRGClass traits: traitsString slots: slotsString classSlots: classSlotsString sharedVariables: sharedVariablesString package: packageName tag: tagName [

	self flag: #todo. "When P12 will be the minimal version used we should use the ShiftClassBuilder instead of manipulation a string. This would make the code a lot easier and we would not rely on compiler evaluation of strings to generate the classes."
	changesToApply add: (FmxClassAddition creationCode: ('Smalltalk classInstaller
	make: [ :builder |
		builder 
			{superclassOrTraitDeclaration};
			name: {className};
			traits: {traits};
			slots: {slots};
			classSlots: {classSlots};
			sharedVariables: {classVariables};
			package: {package};
			tag: {tag}
		 ]' format: (Dictionary newFrom: {
						   (#superclassOrTraitDeclaration -> (aRGClass isTrait
							     ifTrue: [ 'beTrait' ]
							     ifFalse: [ 'superclass: ' , aRGClass superclass name ])).
						   (#className -> aRGClass name asSymbol printString).
						   (#traits -> traitsString).
						   (#slots -> slotsString).
						   (#classSlots -> classSlotsString).
						   (#classVariables -> sharedVariablesString).
						   (#package -> packageName printString).
						   (#tag -> tagName printString) })))
]

{ #category : 'installing' }
FmxMBRingEnvironment >> recordClassChangesFor: aRGClass [

	| realClass |
	realClass := self class environment classNamed: aRGClass name.
	realClass
		ifNil: [
			self
				recordClassAdditionFromClass: aRGClass
				traits: aRGClass traitCompositionString
				slots: aRGClass slotDefinitionString
				classSlots: '{}'
				sharedVariables: '{}'
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
	| sorted notSorted toMove |
	resolvedClasses ifEmpty: [ ^ self ].
	
	notSorted := resolvedClasses asOrderedCollection.

	sorted := OrderedCollection new.
	[ toMove := notSorted select: [ :each | notSorted noneSatisfy: [ :toCompare | each dependsOn: toCompare ] ].
	toMove ifEmpty: [ self error: 'Classes cycling dependency' ].
	sorted addAll: toMove.
	notSorted removeAll: toMove.
	notSorted isEmpty ] whileFalse.

	sorted do: [ :each | self recordClassChangesFor: each ]
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

{ #category : 'accessing' }
FmxMBRingEnvironment >> slotNamed: slotName [
	^ (RGUnknownSlot named: slotName asSymbol) expression: #FMProperty
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> slotNamed: slotName cardinality: cardinality type: type opposite: oppositeName [

	| cardinalityClassName |
	
	cardinalityClassName := cardinality = #one
		ifTrue: [ #FMOne ]
		ifFalse: [ #FMMany ].
		
	^ (RGUnknownSlot named: slotName asSymbol)
		 expression: ('{1} type: #{2} opposite: #{3}' 
			format: { cardinalityClassName. type. oppositeName}) 
]

{ #category : 'accessing' }
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
