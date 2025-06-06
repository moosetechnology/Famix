Class {
	#name : #FmxMBRealRingEnvironment,
	#superclass : #FmxMBRingEnvironment,
	#instVars : [
		'changesToApply'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBRealRingEnvironment >> apply [

	self collectChangesToApply.
	changesToApply select: [ :e | e isRemoval ] thenDo: #apply.
	changesToApply select: [ :e | e isRemoval not ] thenDo: #apply
]

{ #category : #testing }
FmxMBRealRingEnvironment >> changesToApply [
	"Return the list of changes to apply if a regeneration would cause changes in the system."

	self collectChangesToApply.
	^ changesToApply
]

{ #category : #accessing }
FmxMBRealRingEnvironment >> collectChangesToApply [
	| resolvedClasses resolvedPackages |
	changesToApply := OrderedCollection new.
	resolvedPackages := ringEnvironment ask packages select: [ :each | each isRingResolved ].
	resolvedClasses := ringEnvironment ask behaviors select: [ :each | each isRingResolved and: [ each superclass isRingResolved ] ].

	self recordPackagesChangesFor: resolvedPackages.
	self recordClassesChangesFor: resolvedClasses.
	self recordRemovalOfGeneratedEntitiesIn: resolvedPackages notPresentIn: resolvedClasses
]

{ #category : #installing }
FmxMBRealRingEnvironment >> compile: aSource in: aClass classified: aProtocol package: aPackageName [

	| category |
	category := '*' , aPackageName.
	aProtocol ifNotEmpty: [ category := category , '-' , aProtocol ].
	aClass compile: aSource classified: category
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordAdoptionOfClassDefinitionFrom: currentClass to: anRGClassModel [

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

{ #category : #installing }
FmxMBRealRingEnvironment >> recordClassAdditionFromClass: aRGClass traits: traitsString slots: slotsString classSlots: classSlotsString sharedVariables: sharedVariablesString package: packageName tag: tagName [

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

{ #category : #installing }
FmxMBRealRingEnvironment >> recordClassChangesFor: aRGClass [

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

{ #category : #installing }
FmxMBRealRingEnvironment >> recordClassCommentChangeOf: realClass to: anRGClass [

	| newComment |
	newComment := anRGClass comment content.
	(realClass isNotNil and: [ newComment = realClass comment ]) ifTrue: [ ^ self ].

	newComment isEmptyOrNil ifFalse: [ changesToApply add: (FmxClassCommentUpdate className: anRGClass name comment: newComment) ]
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordClassesChangesFor: resolvedClasses [
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

{ #category : #installing }
FmxMBRealRingEnvironment >> recordMethodsAdoptionsOf: realClass to: anRGClass realClassName: aClassName [
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
		ifNotEmpty: [ :methods | changesToApply add: (FmxMethodAdditions className: aClassName isClassSide: anRGClass isClassSide rgMethods: methods) ].

	"Finally, update methods needing updates"
	((generatedMethodNamesOfRealClass intersection: anRGClass localSelectors)
		collect: [ :selectorOfMethodToUpdate | anRGClass methodNamed: selectorOfMethodToUpdate ]
		thenSelect: [ :method | realClass needToAdaptToMethod: method ])
		ifNotEmpty: [ :methods | changesToApply add: (FmxMethodUpdates className: aClassName isClassSide: anRGClass isClassSide rgMethods: methods) ]
]

{ #category : #installing }
FmxMBRealRingEnvironment >> recordPackagesChangesFor: resolvedPackages [

	resolvedPackages
		reject: [ :each | self packageOrganizer hasPackage: each name ]
		thenDo: [ :each | changesToApply add: (FmxPackageAddition named: each name) ]
]

{ #category : #accessing }
FmxMBRealRingEnvironment >> recordRemovalOfGeneratedEntitiesIn: resolvedPackages notPresentIn: resolvedClasses [
	"Since the last generation it is possible some behaviorals were removed from the generator. In that case we should remove them. We will remove all classes and traits of Famix that are not part of the current generator."

	resolvedPackages
		collect: [ :e | e name asPackageIfAbsent: [ nil ] ]
		thenDo: [ :package | 
			package
				ifNotNil:
					[ package definedClasses select: #isMetamodelEntity thenDo: [ :class | resolvedClasses detect: [ :rgClass | rgClass name = class name ] ifNone: [ changesToApply add: (FmxClassRemoval class: class) ] ] ] ]
]

{ #category : #installing }
FmxMBRealRingEnvironment >> traitStringFrom: realClass to: aRGClass [

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
