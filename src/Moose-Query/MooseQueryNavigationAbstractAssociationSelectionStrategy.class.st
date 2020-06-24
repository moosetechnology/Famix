Class {
	#name : #MooseQueryNavigationAbstractAssociationSelectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'as yet unclassified' }
MooseQueryNavigationAbstractAssociationSelectionStrategy >> selectAssociationsIn: aCollection [
	^ self subclassResponsibility
]
