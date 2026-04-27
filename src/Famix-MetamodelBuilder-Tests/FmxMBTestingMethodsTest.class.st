Class {
	#name : 'FmxMBTestingMethodsTest',
	#superclass : 'FmxMBTestCase',
	#instVars : [
		'root1',
		'root2',
		'entity',
		'trait',
		'traited',
		'generatedEntity',
		'generatedTNamed',
		'generatedNamed',
		'traitedRoot',
		'generatedTraitedRoot'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
FmxMBTestingMethodsTest >> setUp [

	super setUp.
	
	root1 := builder newClassNamed: #Root1.	
	root2 := builder newClassNamed: #Root2.	
	entity := builder ensureClassNamed: #Entity.
	trait := builder newTraitNamed: #TNamedEntity.
	traited := builder newClassNamed: #Named.
	traitedRoot := builder newTraitNamed: #TraitedRoot.

	root1 <|-- traited.
	trait <|-- traited.
	trait <|-- traitedRoot.
	
	entity withTesting.
	trait withTesting.
	
	builder generate.

	generatedEntity := builder testingEnvironment ask classNamed: 'TstEntity'.
	generatedTNamed := builder testingEnvironment ask classNamed: 'TstTNamedEntity'.
	generatedNamed := builder testingEnvironment ask classNamed: 'TstNamed'.
	generatedTraitedRoot := builder testingEnvironment ask classNamed: 'TstTraitedRoot'.
	


]

{ #category : 'tests' }
FmxMBTestingMethodsTest >> testTraited [

	self assert: (generatedNamed localMethodNamed: #isNamed ifAbsent: []) isNil.
	self assert: (generatedNamed localMethodNamed: #isEntity ifAbsent: []) isNil.
]

{ #category : 'tests' }
FmxMBTestingMethodsTest >> testTraitedRoot [
	"a testing method should not be generated if it is provided by a trait"

	self assert: (generatedTraitedRoot localMethodNamed: #isNamed ifAbsent: [ nil ]) isNil
]
