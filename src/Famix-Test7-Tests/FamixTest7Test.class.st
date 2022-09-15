Class {
	#name : #FamixTest7Test,
	#superclass : #TestCase,
	#instVars : [
		'model',
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
		'm10',
		'm8',
		'm9',
		'm11'
	],
	#category : #'Famix-Test7-Tests'
}

{ #category : #running }
FamixTest7Test >> setUp [

	super setUp.

	model := FamixTest7Model new.
	c1 := FamixTest7Class named: 'Class1'.
	c2 := FamixTest7Class named: 'Class2'.
	c3 := FamixTest7Class named: 'Class3'.
	
	i1 := FamixTest7Inheritance new. 
	i2 := FamixTest7Inheritance new. 
	
	m1 := FamixTest7Method named: 'method1' model: model.
	m2 := FamixTest7Method named: 'method2' model: model.
	m3 := FamixTest7Method named: 'method3' model: model.
	m4 := FamixTest7Method named: 'method1' model: model.
	m5 := FamixTest7Method named: 'method2' model: model.
	m6 := FamixTest7Method named: 'method3' model: model.
	m7 := FamixTest7Method named: 'method7' model: model.
	m8 := FamixTest7Method named: 'method8' model: model.
	m9 := FamixTest7Method named: 'method8' model: model.
	m10 := FamixTest7Method named: 'method8' model: model.
	m11 := FamixTest7Method named: 'method11' model: model.
	
	
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
	
	model addAll: { c1. c2. c3. i1. i2. }.
	
	i1 superclass: c1; subclass: c2.
	"opposite way"
	c2 addSubInheritance: i2. 	
	c3 addSuperInheritance: i2.
	

]

{ #category : #running }
FamixTest7Test >> testClassNumberOfMethods [

	self assert: c1 methods size equals: 4.
	self assert: c2 methods size equals: 3.
	self assert: c3 methods size equals: 4.
]

{ #category : #running }
FamixTest7Test >> testInheritedMethods [

	self assert: c1 inheritedMethods size equals: 0.
	self assertCollection: c2 inheritedMethods hasSameElements: {m1. m11}.
	self assertCollection: c3 inheritedMethods hasSameElements: { m3. m5. m11 }
]
