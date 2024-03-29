Class {
	#name : #FamixWithMethodsTest,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixWithMethodsTest >> setUp [
	super setUp.
	c1
		sourceAnchor: nil;
		attributes: #()
]

{ #category : #tests }
FamixWithMethodsTest >> testAddMethod [
	
	| newMethod | 
	
	newMethod := FamixTest1Method named: #newMethod.
	self deny: (c1 methods includes: newMethod).
	c1 addMethod: newMethod.
	self assert: (c1 methods includes: newMethod).
]

{ #category : #tests }
FamixWithMethodsTest >> testMethods [
	
	| newMethod1 newMethod2 | 
	
	newMethod1 := FamixTest1Method named: #newMethod1.
	newMethod2 := FamixTest1Method named: #newMethod2.

	c1 methods: { newMethod1. newMethod2 }.
	self assertCollection: c1 methods hasSameElements: { newMethod1. newMethod2 }.
	self assert: newMethod1 parentType equals: c1. 
	self assert: newMethod2 parentType equals: c1. 
	
	
]

{ #category : #tests }
FamixWithMethodsTest >> testMethodsGroup [
	
	| group | 
	
	group := c1 methodsGroup.
	self assertCollection: group entities hasSameElements: { m1 }.
]

{ #category : #tests }
FamixWithMethodsTest >> testNumberOfLinesOfCode [

	self assert: c1 numberOfLinesOfCode equals: 2.
	self assert: c2 numberOfLinesOfCode equals: 7.


]

{ #category : #tests }
FamixWithMethodsTest >> testNumberOfMethods [

	self assert: c1 numberOfMethods equals: 1.
	self assert: c2 numberOfMethods equals: 2.

	"explicit count"
	c1 numberOfMethods: 100.
	self assert: c1 numberOfMethods equals: 100.

]

{ #category : #tests }
FamixWithMethodsTest >> testRelations [

	self assertCollection: c1 methods hasSameElements:  { m1 }.	
	self assertCollection: c2 methods hasSameElements:  { m2. m3 }.
	self assertCollection: m1 parentType equals: c1.
	self assertCollection: m2 parentType equals: c2.
]

{ #category : #tests }
FamixWithMethodsTest >> testWeightedMethodCount [

	self assert: c1 weightedMethodCount equals: model notExistentMetricValue
]
