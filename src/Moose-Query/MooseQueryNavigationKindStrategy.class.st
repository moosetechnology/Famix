Class {
	#name : #MooseQueryNavigationKindStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'as yet unclassified' }
MooseQueryNavigationKindStrategy class >> collectResultFrom: aCollection query: aQuery [
	^ self subclassResponsibility
]
