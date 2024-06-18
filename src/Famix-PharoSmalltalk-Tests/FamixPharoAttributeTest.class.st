Class {
	#name : #FamixPharoAttributeTest,
	#superclass : #TestCase,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixPharoAttributeTest >> testIsClassSide [

	| attribute |
	attribute := FamixStAttribute new.
	attribute isClassSide: true.
	self assert: attribute isClassSide
]

{ #category : #tests }
FamixPharoAttributeTest >> testSharedVariableArePersisted [

	| attribute |
	attribute := FamixStAttribute new.
	attribute
		isClassSide: true;
		beSharedVariable.
	self assert: attribute isSharedVariable.

	attribute flush.
	self assert: attribute isSharedVariable
]
