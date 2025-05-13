"
A MooseGroupStorageTest is a test class for testing the behavior of MooseGroupStorage
"
Class {
	#name : #MooseGroupStorageTest,
	#superclass : #TestCase,
	#category : #'Moose-Core-Tests'
}

{ #category : #test }
MooseGroupStorageTest >> testSpecies [

	| groupA anEntity |
	groupA := MooseModel new.
	anEntity := MooseEntity new.
	groupA add: anEntity.
	groupA add: anEntity.
	self assert: groupA size equals: 2.
	groupA entityStorage species: Set.
	self assert: groupA size equals: 1.
]
