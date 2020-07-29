"
A FamixTest1ModelTest is a test class for testing the behavior of FamixTest1Model
"
Class {
	#name : #FamixTest1ModelTest,
	#superclass : #TestCase,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
FamixTest1ModelTest >> testModelCanBeGenerated [
	self assert: (self class environment classNamed: 'FamixTest1Model') isNotNil
]

{ #category : #tests }
FamixTest1ModelTest >> testModelCanHaveComment [
	self assert: (self class environment classNamed: 'FamixTest1Model') comment isNotEmpty
]

{ #category : #tests }
FamixTest1ModelTest >> testModelCanHaveProperties [
	self assert: ((self class environment classNamed: 'FamixTest1Model') new modelHasProperties: 3) isNotNil
]
