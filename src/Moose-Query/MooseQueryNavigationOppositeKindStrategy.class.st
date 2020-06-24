Class {
	#name : #MooseQueryNavigationOppositeKindStrategy,
	#superclass : #MooseQueryNavigationKindStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'as yet unclassified' }
MooseQueryNavigationOppositeKindStrategy class >> collectResultFrom: aCollection query: aQuery [
	^ aCollection collect: [ :each | aQuery directionStrategy entityFor: each ]
]
