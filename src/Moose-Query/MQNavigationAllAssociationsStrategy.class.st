"
Description
--------------------

I am a stategy (Strategy Design Pattern) used in Navigation queries to define that we should select all kind of associations.

"
Class {
	#name : #MQNavigationAllAssociationsStrategy,
	#superclass : #MQNavigationAssociationSelectionStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #enumerating }
MQNavigationAllAssociationsStrategy >> selectAssociationsIn: aCollection [
	^ aCollection
]
