Class {
	#name : 'FamixTest1InheritanceTest',
	#superclass : 'FamixAbstractExportTestCase',
	#instVars : [
		'c1',
		'c2',
		'c3',
		'i1',
		'i2'
	],
	#category : 'Famix-Test1-Tests',
	#package : 'Famix-Test1-Tests'
}

{ #category : 'running' }
FamixTest1InheritanceTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	c3 := FamixTest1Class named: 'Class3'.

	i1 := FamixTest1Inheritance new.
	i2 := FamixTest1Inheritance new.

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
	c1 addSubInheritance: i2.
	c3 addSuperInheritance: i2
]

{ #category : 'tests' }
FamixTest1InheritanceTest >> testInheritances [

	self assertCollection: (c1 subInheritances collect: #subclass) hasSameElements: {
			c2.
			c3 }.
	self assertEmpty: c2 subInheritances.
	self assertEmpty: c3 subInheritances
]
