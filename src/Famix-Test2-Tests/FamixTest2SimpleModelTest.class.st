Class {
	#name : #FamixTest2SimpleModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Test2-Tests'
}

{ #category : #testing }
FamixTest2SimpleModelTest class >> isAbstract [
	^ self = FamixTest2SimpleModelTest
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> c1 [
	^ model entityNamed: #Class1
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> c2 [
	^ model entityNamed: #Class2
]

{ #category : #tests }
FamixTest2SimpleModelTest >> classGroup [
	^ self class environment at: #FamixTest2ClassGroup
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> inv1 [
	^ (model allUsing: FamixTInvocation) anyOne
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> m1 [
	^ model entityNamed: 'Class1.m1'
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> m2 [
	^ model entityNamed: 'Class2.m2'
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> pt1 [
	^ model entityNamed: #int
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> pt2 [
	^ model entityNamed: #float
]

{ #category : #accessing }
FamixTest2SimpleModelTest >> ref1 [
	^ (model allUsing: FamixTReference) detect: [ :ref | ref source = self m1 and: [ ref target = self pt1 ] ]
]

{ #category : #running }
FamixTest2SimpleModelTest >> setUp [
	| c1 c2 m1 m2 pt1 |
	super setUp.

	model := FamixTest2Model new.

	c1 := FamixTest2Class named: 'Class1' model: model.
	c2 := FamixTest2Class named: 'Class2' model: model.

	m1 := FamixTest2Method named: 'm1' model: model.
	m2 := FamixTest2Method named: 'm2' model: model.

	pt1 := FamixTest2PrimitiveType named: 'int' model: model.
	FamixTest2PrimitiveType named: 'float' model: model.

	FamixTest2Reference source: m1 target: pt1 model: model.
	FamixTest2Reference source: m1 target: c1 model: model.
	FamixTest2Invocation source: m1 target: {m1} model: model.

	m1 parentType: c1.
	m2 parentType: c2
]

{ #category : #tests }
FamixTest2SimpleModelTest >> typeGroup [
	^ self class environment at: #FamixTest2TypeGroup
]
