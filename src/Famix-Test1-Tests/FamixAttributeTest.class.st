Class {
	#name : #FamixAttributeTest,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
FamixAttributeTest >> testIsClassSide [

	a1 isClassSide: true.
	self assert: a1 isClassSide .
]
