Class {
	#name : #MooseQueryNavigationOppositeKindStrategy,
	#superclass : #MooseQueryNavigationKindStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'as yet unclassified' }
MooseQueryNavigationOppositeKindStrategy class >> getEntityFor: anEntity linkedTo: anotherEntity query: aQuery [
	^ (aQuery directionStrategy ensureAssociation: anEntity with: anotherEntity) perform: aQuery directionStrategy symbolToCollectEntities
]

{ #category : #'as yet unclassified' }
MooseQueryNavigationOppositeKindStrategy class >> matchingEntitiesIn: aCollection association: aClass query: aQuery [
	self flag: #todo.	"The perform can be avoided."
	^ aCollection
		select: [ :each | each isOfType: aClass ]
		thenCollect: [ :each | each perform: aQuery directionStrategy symbolToCollectEntities ]
]
