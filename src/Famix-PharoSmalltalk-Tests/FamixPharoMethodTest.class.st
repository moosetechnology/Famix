Class {
	#name : #FamixPharoMethodTest,
	#superclass : #TestCase,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #tests }
FamixPharoMethodTest >> testIsClassSide [
	| method |
	method := FamixStMethod new.
	method isClassSide: true.
	self assert: method isClassSide .
]
