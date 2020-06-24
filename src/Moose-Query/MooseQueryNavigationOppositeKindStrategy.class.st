Class {
	#name : #MooseQueryNavigationOppositeKindStrategy,
	#superclass : #MooseQueryNavigationKindStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'as yet unclassified' }
MooseQueryNavigationOppositeKindStrategy class >> getEntityFor: anEntity linkedTo: anotherEntity query: aQuery [
	^ aQuery directionStrategy entityFor: (aQuery directionStrategy ensureAssociation: anEntity with: anotherEntity)
]

{ #category : #'as yet unclassified' }
MooseQueryNavigationOppositeKindStrategy class >> matchingEntitiesIn: aCollection query: aQuery [
	^ aCollection collect: [ :each | aQuery directionStrategy entityFor: each ]
]
