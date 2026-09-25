Class {
	#name : 'FamixTest1SimpleModelTest',
	#superclass : 'FamixAbstractExportTestCase',
	#instVars : [
		'c1',
		'c2',
		'm1',
		'm2',
		'm3',
		'a1',
		'constructor'
	],
	#category : 'Famix-Test1-Tests',
	#package : 'Famix-Test1-Tests'
}

{ #category : 'testing' }
FamixTest1SimpleModelTest class >> isAbstract [
	^ self = FamixTest1SimpleModelTest
]

{ #category : 'accessing' }
FamixTest1SimpleModelTest >> anchor1 [

	^ m1 sourceAnchor
]

{ #category : 'accessing' }
FamixTest1SimpleModelTest >> anchor2 [

	^ m2 sourceAnchor
]

{ #category : 'accessing' }
FamixTest1SimpleModelTest >> anchor3 [

	^ m3 sourceAnchor
]

{ #category : 'running' }
FamixTest1SimpleModelTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	c1 := FamixTest1Class named: 'Class1' model: model.
	c2 := FamixTest1Class named: 'Class2' model: model.
	constructor := FamixTest1Method named: 'Class1' model: model.
	constructor numberOfLinesOfCode: 0.
	m1 := FamixTest1Method named: 'method1' model: model.
	m2 := FamixTest1Method named: 'method2' model: model.
	m3 := FamixTest1Method named: 'method3' model: model.
	a1 := FamixTest1Attribute named: 'attribute1' model: model.
	constructor parentType: c1.
	m1 parentType: c1.
	m2 parentType: c2. "opposite way"
	m3 parentType: c2.
	c1 addAttribute: a1.
	c1 sourceAnchor: (FamixTest1SourceTextAnchor source: 'Class1 definition' withCRs model: model).
	m1 sourceAnchor: (FamixTest1SourceTextAnchor source: 'method1\source1' withCRs model: model).
	m2 sourceAnchor: (FamixTest1SourceTextAnchor source: 'method2\source2a\source2b' withCRs model: model).
	m3 sourceAnchor: (FamixTest1SourceTextAnchor source: 'method3\source3a\source3b\source3c' withCRs model: model).
	a1 sourceAnchor: (FamixTest1SourceTextAnchor source: 'Attribute1 definition' withCRs model: model)
]
