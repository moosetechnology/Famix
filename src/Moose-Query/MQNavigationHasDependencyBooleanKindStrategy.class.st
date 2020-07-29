"
Description
--------------------

I am a stategy (Strategy Design Pattern) used in Navigation queries to define that queries should return a boolean indicating if the entity has dependencies or not.
"
Class {
	#name : #MQNavigationHasDependencyBooleanKindStrategy,
	#superclass : #MQNavigationResultKindStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #enumerating }
MQNavigationHasDependencyBooleanKindStrategy class >> collectResultFrom: aCollection query: aQuery [
	^ self shouldNotImplement
]

{ #category : #running }
MQNavigationHasDependencyBooleanKindStrategy class >> execute: aQuery [
	^ aQuery executeHasQuery
]

{ #category : #running }
MQNavigationHasDependencyBooleanKindStrategy class >> queryResultKindFor: aQuery [
	^ self shouldNotImplement
]
