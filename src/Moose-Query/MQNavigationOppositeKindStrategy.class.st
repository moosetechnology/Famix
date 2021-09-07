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

	"We flat collect because some associations have multivalued targets (ex: TAssociation has #candidates) and some have only 1 target.
	The mechanisms of #flatCollect: only works if all items in the collection are collections, 
		so we use the mechanism of #flattened while collecting."

	^ Array streamContents: [ :stream | 
		  aCollection do: [ :each | 
			  (aQuery directionStrategy entityFor: each) flattenOn: stream ] ]
]

{ #category : #running }
MQNavigationOppositeKindStrategy class >> queryResultKindFor: aQuery [
	^ MooseObjectQueryResult
]
