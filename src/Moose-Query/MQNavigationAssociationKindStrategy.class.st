"
Description
--------------------

I am a stategy (Strategy Design Pattern) used in Navigation queries to define that queries should return the associations representing dependencies.
"
Class {
	#name : #MQNavigationAssociationKindStrategy,
	#superclass : #MQNavigationResultKindStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #enumerating }
MQNavigationAssociationKindStrategy class >> collectResultFrom: aCollection query: aQuery [
	^ aCollection
]
