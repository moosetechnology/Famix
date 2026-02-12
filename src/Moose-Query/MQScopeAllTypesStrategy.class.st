"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should match all kinds of entity.

I am moslty here for performance reasons.
"
Class {
	#name : 'MQScopeAllTypesStrategy',
	#superclass : 'MQScopeAbstractStopStrategy',
	#category : 'Moose-Query-Scoping',
	#package : 'Moose-Query',
	#tag : 'Scoping'
}

{ #category : 'testing' }
MQScopeAllTypesStrategy >> selectMatchingElements: aCollection [

	^ aCollection
]
