"
Description
--------------------

I am a stategy (Strategy Design Pattern) used in Navigation queries to define that queries should return an object that is the opposite of the query receiver from the associations selected by the query.
"
Class {
	#name : #MQNavigationOppositeKindStrategy,
	#superclass : #MQNavigationResultKindStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #enumerating }
MQNavigationOppositeKindStrategy class >> collectResultFrom: aCollection query: aQuery [
	^ aCollection collect: [ :each | aQuery directionStrategy entityFor: each ]
]

{ #category : #running }
MQNavigationOppositeKindStrategy class >> queryResultKindFor: aQuery [
	^ MooseObjectQueryResult
]
