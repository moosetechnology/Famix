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
	self assert: attribute isClassSide .
]
