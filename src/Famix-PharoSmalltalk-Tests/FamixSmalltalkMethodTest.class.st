Class {
	#name : #FamixSmalltalkMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'c2',
		'c3',
		'm1',
		'm2',
		'm3',
		'anchor1',
		'anchor2',
		'anchor3',
		'package'
	],
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #running }
FamixSmalltalkMethodTest >> setUp [
	super setUp.

	model := FamixStModel new.
	package := FamixStPackage named: 'Pckg'.
	c1 := FamixStClass named: 'Class1'.
	c2 := FamixStClass named: 'Class2'.
	m1 := FamixStMethod named: 'method1'.
	m2 := FamixStMethod named: 'method2'.
	m3 := FamixStMethod named: 'method3'.
	anchor1 := FamixStSourceTextAnchor source: 'method1\source1' withCRs.
	anchor2 := FamixStSourceTextAnchor source: 'method2\source2a\source2b' withCRs.
	anchor3 := FamixStSourceTextAnchor source: 'method3\source3a\source3b\source3c' withCRs.

	model addAll: {package. c1 . c2 . m1 . m2 . m3 . anchor1 . anchor2}.
	{ c1 . c2 . m1 . m2 . m3 } do: [ :entity | entity parentPackage: package ].

	c1 addMethod: m1.
	m2 parentType: c2.	"opposite way"
	c2 addMethod: m3.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3
]

{ #category : #tests }
FamixSmalltalkMethodTest >> testMetricsForStubMethods [
	| stubMethod notExistingMetricValue |
	stubMethod := FamixStMethod new
		stub: true;
		yourself.
	notExistingMetricValue := MooseModel new notExistentMetricValue.
	self
		assert: stubMethod cyclomaticComplexity
		equals: notExistingMetricValue.
	self
		assert: stubMethod numberOfConditionals
		equals: notExistingMetricValue.
	self
		assert: stubMethod numberOfMessageSends
		equals: notExistingMetricValue.
	self
		assert: stubMethod numberOfStatements
		equals: notExistingMetricValue
]

{ #category : #tests }
FamixSmalltalkMethodTest >> testNumberOfMethodProtocols [

	m1 protocol: #accessing.
	self assert: c1 numberOfMethodProtocols equals: 1.
	c1 numberOfMethodProtocols: 100.
	self assert: c1 numberOfMethodProtocols equals: 100.

]

{ #category : #tests }
FamixSmalltalkMethodTest >> testOverride [
	| newM1 |
	newM1 := FamixStMethod named: 'method1'.
	c2 addMethod: newM1.
	c2
		addSuperInheritance:
			(FamixStInheritance new
				subclass: c2;
				superclass: c1).
	self assert: newM1 isOverriding.
	self assert: m1 isOverridden
]

{ #category : #tests }
FamixSmalltalkMethodTest >> testProtocol [

	self assert: m1 protocol isNil.
	m1 protocol: 'accessing'.
	self assert: m1 protocol equals: 'accessing'.

]
