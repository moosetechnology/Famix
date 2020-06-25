"
Description
--------------------

I am an abstract stategy (Strategy Design Pattern) used in Navigation queries to define which kind of dependencies the query should return.

Public API and Key Messages
--------------------

- #selectAssociationsIn: 		Takes a collection of associations and returns only the one we are interested in for the query.
"
Class {
	#name : #MQNavigationAssociationSelectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Navigating'
}

{ #category : #testing }
MQNavigationAssociationSelectionStrategy class >> isAbstract [
	^ self = MQNavigationAssociationSelectionStrategy
]

{ #category : #accessing }
MQNavigationAssociationSelectionStrategy class >> strategies [
	^ self allSubclasses reject: #isAbstract
]

{ #category : #enumerating }
MQNavigationAssociationSelectionStrategy >> selectAssociationsIn: aCollection [
	"I return a collection of associations matching the kind of dependencies asked by the user in the query from the collection of associations I got in parameter."

	^ self subclassResponsibility
]
