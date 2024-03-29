Class {
	#name : #FmxMBGeneratorCleaningStrategyTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'generator'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #accessing }
FmxMBGeneratorCleaningStrategyTest class >> defaultTimeLimit [
	^ 20 seconds
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> generateClasses [

	| generatedClassToRemove generatedTraitToRemove |
	FamixMetamodelCleaningStrategiesTestGenerator new generate.

	"We add a Trait precedence to ensure it will be removed."
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithTraitPrecedenceToRemove
		ifPresent: [ :class | class setTraitComposition: (class traitComposition withPrecedenceOf: (self class environment at: #FmxTestCleaningStrategyTATrait)) ]
		ifAbsent: [ self fail ].

	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class |
			class
				compile: 'banana

	^ 42'
				classified: #monkey.
			class class
				compile: 'tree

	^ #Christopher'
				classified: #monkey.
			class
				compile: 'generatedBanana
	<generated>
	^ #Christopher'
				classified: #monkey.
			class
				compile: 'potatoExtendedMethod

	^ 42'
				classified: #* , self class package name.
			class addToComposition: FamixTestExternalTraits.
			class addInstVarNamed: 'bananaTree'.
			class addClassVarNamed: 'Fuhrmanator'.
			class class addInstVarNamed: 'grandFrais'.
			(class slotNamed: #fursonas) inClass: #FmxTestCleaningStrategyFmxTestEntity "Here we change the type of the slot to ensure it is regenerated correctly" ]
		ifAbsent: [ self fail ].
	self class classInstaller make: [ :aBuilder |
		aBuilder
			name: #FmxCleanerTestAddedClass;
			package: self packageName ].
	self class classInstaller make: [ :aBuilder |
		aBuilder
			beTrait;
			name: #TFmxCleanerTestAddedTrait;
			package: self packageName ].

	"We add a class with Famix pragma to ensure it is deleted after the generation."
	generatedClassToRemove := self class classInstaller make: [ :aBuilder |
		                          aBuilder
			                          superclass: MooseEntity;
			                          name: #FmxCleanerTestAddedClassFromFamix;
			                          package: self packageName ].
	generatedClassToRemove class compile: 'annotation

	<FMClass: #AddedClassFromFamix super: #MooseEntity>
	<package: #'',  self packageName , ''>
	<generated>
	^self'.

	"We add a Trait with Famix pragma to ensure it is deleted after the generation."
	generatedTraitToRemove := self class classInstaller make: [ :aBuilder |
		                          aBuilder
			                          beTrait;
			                          name: #FmxCleanerTestTAddedClassFromFamix;
			                          package: self packageName ].
	generatedTraitToRemove class compile: 'annotation

	<FMClass: #TAddedClassFromFamix super: #Trait>
	<package: #'',  self packageName , ''>
	<generated>
	^self'.

	"We change the superclass of this class to ensure regeneration will update it. Check non regression for: https://github.com/moosetechnology/Moose/issues/1668"
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass
		ifPresent: [ :class |
			self class classInstaller make: [ :aBuilder |
				aBuilder
					superclass: MooseEntity;
					name: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass;
					package: 'Famix-MetamodelBuilder-TestsResources-Entities' ] ]
		ifAbsent: [ self fail ].
	self class compile: 'extensionsMethodForTest' classified: '*' , generator packageName
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> packageName [
	^ 'Famix-MetamodelBuilder-TestsResources'
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> setUp [
	super setUp.
	generator := FamixMetamodelCleaningStrategiesTestGenerator new.
	self generateClasses
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> tearDown [

	[ self packageName asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	super tearDown
]

{ #category : #tests }
FmxMBGeneratorCleaningStrategyTest >> testGenerateNoCleaningCleaning [
	generator withoutCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class localMethods anySatisfy: [ :method | method selector = #tree ]).
			self assert: (class localMethods anySatisfy: [ :method | method selector = #banana ]).
			self assert: (class localMethods anySatisfy: [ :method | method selector = #generatedBanana ]).
			self assert: (class localMethods anySatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class localMethods detect: [ :method | method selector = #potatoExtendedMethod ]) protocolName equals: #* , self class package name.
			self assert: (class traitComposition allTraits anySatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).
			self assert: (class hasInstVarNamed: #bananaTree).
			self assert: (class hasClassVarNamed: #Fuhrmanator).
			self assert: (class class hasInstVarNamed: #grandFrais).
			self assert: (class hasInstVarNamed: #fursonas).
			self assert: (class slotNamed: #fursonas) definitionString equals: '#fursonas => FMMany type: #FmxTestCleaningStrategyFmxTestEntity opposite: #furry' ]
		ifAbsent: [ self fail ].

	"Before the generation the precedence we added should still be here."
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithTraitPrecedenceToRemove
		ifPresent: [ :class | self assert: class traitComposition isPrecedingSequence ]
		ifAbsent: [ self fail ].

	"Before the generation, the superclass should not be updated."
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass
		ifPresent: [ :class | self assert: class superclass name equals: #MooseEntity ]
		ifAbsent: [ self fail ].

	"Before the generation, the generated class and trait that were removed from the generator should still be here."
	self class environment at: #FmxCleanerTestAddedClassFromFamix ifAbsent: [ self fail ].
	self class environment at: #FmxCleanerTestTAddedClassFromFamix ifAbsent: [ self fail ].

	self
		assert:
			(self class methodDict
				at: #extensionsMethodForTest
				ifPresent: [ true ]
				ifAbsent: [ false ]).

	self class environment
		at: #FmxCleanerTestAddedClass
		ifPresent: [ :class | self assert: class package name equals: self packageName ]
		ifAbsent: [ self fail ].
	self class environment
		at: #TFmxCleanerTestAddedTrait
		ifPresent: [ :class | self assert: class package name equals: self packageName ]
		ifAbsent: [ self fail ]
]

{ #category : #tests }
FmxMBGeneratorCleaningStrategyTest >> testGenerateNoCleaningGeneration [
	generator generateWithoutCleaning.

	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class localMethods anySatisfy: [ :method | method selector = #tree ]).
			self assert: (class class localMethods detect: [ :method | method selector = #tree ]) protocolName equals: 'monkey'.
			self assert: (class localMethods anySatisfy: [ :method | method selector = #banana ]).
			self assert: (class localMethods detect: [ :method | method selector = #banana ]) protocolName equals: 'monkey'.
			"Generated methods that were removed from the generator should be removed after a new generation."
			self deny: (class localMethods anySatisfy: [ :method | method selector = #generatedBanana ]).
			self assert: (class localMethods anySatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class localMethods detect: [ :method | method selector = #potatoExtendedMethod ]) protocolName equals: #* , self class package name.
			self assert: (class traitComposition allTraits anySatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).
			self assert: (class hasInstVarNamed: #bananaTree).
			self assert: (class hasClassVarNamed: #Fuhrmanator).
			self assert: (class class hasInstVarNamed: #grandFrais).
			self assert: (class hasInstVarNamed: #fursonas).
			self assert: (class slotNamed: #fursonas) definitionString equals: '#fursonas => FMMany type: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass opposite: #furry' ]
		ifAbsent: [ self fail ].
		
	"The generation should remove the precedence that is not present anymore"
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithTraitPrecedenceToRemove
		ifPresent: [ :class | self deny: class traitComposition isPrecedingSequence ]
		ifAbsent: [ self fail ].

	"After the generation, the superclass should be updated to be the one described in the generator."
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass
		ifPresent: [ :class | self assert: class superclass name equals: #FmxTestCleaningStrategyFmxTestEntity ]
		ifAbsent: [ self fail ].

	"After the generation, the generated class and trait that were removed from the generator should be removed."
	self should: [ self class environment at: #FmxCleanerTestAddedClassFromFamix ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxCleanerTestTAddedClassFromFamix ] raise: KeyNotFound.

	self assert: (self class methodDict at: #extensionsMethodForTest ifPresent: [ true ] ifAbsent: [ false ]).

	self class environment at: #FmxCleanerTestAddedClass ifPresent: [ :class | self assert: class package name equals: self packageName ] ifAbsent: [ self fail ].
	self class environment at: #TFmxCleanerTestAddedTrait ifPresent: [ :class | self assert: class package name equals: self packageName ] ifAbsent: [ self fail ]
]

{ #category : #tests }
FmxMBGeneratorCleaningStrategyTest >> testGenerateTotalCleaningCleaning [
	generator withCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self should: [ self class environment at: #FmxTestCleaningStrategyFmxTestEntity ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxCleanerTestAddedClass ] raise: KeyNotFound.
	self should: [ self class environment at: #TFmxCleanerTestAddedTrait ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxCleanerTestAddedClassFromFamix ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxCleanerTestTAddedClassFromFamix ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxTestCleaningStrategyFmxTestEntityWithTraitPrecedenceToRemove ] raise: KeyNotFound.

	self assert: (self class methodDict at: #extensionsMethodForTest ifPresent: [ false ] ifAbsent: [ true ])
]

{ #category : #tests }
FmxMBGeneratorCleaningStrategyTest >> testGenerateTotalCleaningGeneration [
	generator generateWithCleaning.

	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class localMethods noneSatisfy: [ :method | method selector = #tree ]).
			self assert: (class localMethods noneSatisfy: [ :method | method selector = #banana ]).
			self assert: (class localMethods noneSatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class traitComposition allTraits noneSatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).
			self deny: (class localMethods anySatisfy: [ :method | method selector = #generatedBanana ]).
			self deny: (class hasInstVarNamed: #bananaTree).
			self deny: (class hasClassVarNamed: #Fuhrmanator).
			self deny: (class class hasInstVarNamed: #grandFrais).
			self assert: (class hasInstVarNamed: #fursonas).
			self assert: (class slotNamed: #fursonas) definitionString equals: '#fursonas => FMMany type: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass opposite: #furry' ]
		ifAbsent: [ self fail ].

	"The generation should remove the precedence that is not present anymore"
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithTraitPrecedenceToRemove
		ifPresent: [ :class | self deny: class traitComposition isPrecedingSequence ]
		ifAbsent: [ self fail ].

	"After the generation, the superclass should be updated."
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntityWithDifferentSuperclass
		ifPresent: [ :class | self assert: class superclass name equals: #FmxTestCleaningStrategyFmxTestEntity ]
		ifAbsent: [ self fail ].

	"After the generation, the generated class and trait that were removed from the generator should not be generated again."
	self should: [ self class environment at: #FmxCleanerTestAddedClassFromFamix ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxCleanerTestTAddedClassFromFamix ] raise: KeyNotFound.

	self assert: (self class methodDict at: #extensionsMethodForTest ifPresent: [ false ] ifAbsent: [ true ]).

	self should: [ self class environment at: #FmxCleanerTestAddedClass ] raise: KeyNotFound.
	self should: [ self class environment at: #TFmxCleanerTestAddedTrait ] raise: KeyNotFound
]
