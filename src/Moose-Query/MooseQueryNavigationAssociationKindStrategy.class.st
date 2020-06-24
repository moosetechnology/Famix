Class {
	#name : #MooseQueryNavigationAssociationKindStrategy,
	#superclass : #MooseQueryNavigationKindStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'as yet unclassified' }
MooseQueryNavigationAssociationKindStrategy class >> getEntityFor: anEntity linkedTo: anotherEntity query: aQuery [
	^ aQuery directionStrategy ensureAssociation: anEntity with: anotherEntity
]

{ #category : #'as yet unclassified' }
MooseQueryNavigationAssociationKindStrategy class >> matchingEntitiesIn: aCollection association: aClass query: aQuery [
	^ aCollection select: [ :each | each isOfType: aClass ]
]
