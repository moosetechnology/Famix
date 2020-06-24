Class {
	#name : #MooseQueryNavigationKindStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'as yet unclassified' }
MooseQueryNavigationKindStrategy class >> getEntityFor: anEntity linkedTo: anotherEntity query: aQuery [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MooseQueryNavigationKindStrategy class >> matchingEntitiesIn: aCollection association: aClass query: aQuery [
	^ self subclassResponsibility
]
