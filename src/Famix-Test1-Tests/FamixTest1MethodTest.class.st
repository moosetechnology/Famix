Class {
	#name : #FamixTest1MethodTest,
	#superclass : #FamixAbstractExportTestCase,
	#instVars : [
		'c1',
		'c2',
		'c3',
		'i1',
		'i2',
		'm1',
		'm2',
		'm3',
		'm4',
		'm5',
		'm6',
		'm7',
		'm8',
		'm9',
		'm10',
		'm11'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixTest1MethodTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	c3 := FamixTest1Class named: 'Class3'.

	i1 := FamixTest1Inheritance new.
	i2 := FamixTest1Inheritance new.

	m1 := FamixTest1Method named: 'method1' model: model.
	m2 := FamixTest1Method named: 'method2' model: model.
	m3 := FamixTest1Method named: 'method3' model: model.
	m4 := FamixTest1Method named: 'method1' model: model.
	m5 := FamixTest1Method named: 'method2' model: model.
	m6 := FamixTest1Method named: 'method3' model: model.
	m7 := FamixTest1Method named: 'method7' model: model.
	m8 := FamixTest1Method named: 'method8' model: model.
	m9 := FamixTest1Method named: 'method8' model: model.
	m10 := FamixTest1Method named: 'method8' model: model.
	m11 := FamixTest1Method named: 'method11' model: model.


	m1 signature: 'method1(String,Class<Dossier>,String,boolean)'.
	m4 signature: 'method1(String,Class<Dossier>,String,boolean)'.
	m2 signature: 'method2(boolean,int)'.
	m5 signature: 'method2(boolean,int)'.
	m3 signature: 'method3(String)'.
	m6 signature: 'method3()'.
	m7 signature: 'method7(int)'.
	m8 signature: 'method8(int)'.
	m9 signature: 'method8(int)'.
	m10 signature: 'method8(int)'.
	m11 signature: 'method11(String, int)'.

	c1 addMethod: m1.
	c1 addMethod: m2.
	c1 addMethod: m8.
	c1 addMethod: m11.

	c2 addMethod: m5.
	c2 addMethod: m3.
	c2 addMethod: m9.

	c3 addMethod: m4.
	c3 addMethod: m6.
	c3 addMethod: m7.
	c3 addMethod: m10.

	model addAll: {
			c1.
			c2.
			c3.
			i1.
			i2 }.

	i1
		superclass: c1;
		subclass: c2.
	"opposite way"
	c2 addSubInheritance: i2.
	c3 addSuperInheritance: i2
]

{ #category : #tests }
FamixTest1MethodTest >> testAddedMethods [

	self assertCollection: c1 addedMethods hasSameElements: c1 methods.
	self assertCollection: c2 addedMethods hasSameElements: { m3 }.
	self assertCollection: c3 addedMethods hasSameElements: {
			m6.
			m7 }
]

{ #category : #tests }
FamixTest1MethodTest >> testAllHierarchyMethods [

	self assert: c1 allHierarchyMethods isEmpty.
	self assertCollection: c2 allHierarchyMethods hasSameElements: c1 methods.
	self assertCollection: c3 allHierarchyMethods hasSameElements: c1 methods , c2 methods
]

{ #category : #tests }
FamixTest1MethodTest >> testAllMethods [

	self assertCollection: c1 allMethods hasSameElements: c1 methods.
	self assertCollection: c2 allMethods hasSameElements: {
			m3.
			m5.
			m9.
			m1.
			m11 }.
	self assertCollection: c3 allMethods hasSameElements: {
			m4.
			m6.
			m7.
			m10.
			m3.
			m5.
			m11 }
]

{ #category : #tests }
FamixTest1MethodTest >> testClassNumberOfMethods [

	self assert: c1 methods size equals: 4.
	self assert: c2 methods size equals: 3.
	self assert: c3 methods size equals: 4
]

{ #category : #tests }
FamixTest1MethodTest >> testInheritedMethods [

	self assert: c1 inheritedMethods size equals: 0.
	self assertCollection: c2 inheritedMethods hasSameElements: {
			m1.
			m11 }.
	self assertCollection: c3 inheritedMethods hasSameElements: {
			m3.
			m5.
			m11 }
]

{ #category : #tests }
FamixTest1MethodTest >> testOverriddenMethods [

	self assert: c1 overriddenMethods isEmpty.
	self assertCollection: c2 overriddenMethods hasSameElements: {
			m5.
			m9 }.
	self assertCollection: c3 overriddenMethods hasSameElements: {
			m4.
			m10 }
]
