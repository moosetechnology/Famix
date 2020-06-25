"
Description
--------------------

I am an abstract stategy (Strategy Design Pattern) used in Navigation queries to define the kind of entities the navigation query should return.

Public API and Key Messages
--------------------

- #collectResultFrom:query: 		Takes a collection of associations and a query an return the entities the query should return from those.

"
Class {
	#name : #MQNavigationResultKindStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Navigating'
}

{ #category : #enumerating }
MQNavigationResultKindStrategy class >> collectResultFrom: aCollection query: aQuery [
	"I should retrun the entities to add to the query result depending on the collection of association I receive."

	^ self subclassResponsibility
]
