"
Description
--------------------

I am a strategy used by the relation queries to define that the query should match all kinds of relations.
"
Class {
	#name : 'MQRelationAllTypesStrategy',
	#superclass : 'MQAbstractRelationStrategy',
	#category : 'Moose-Query-Relations',
	#package : 'Moose-Query',
	#tag : 'Relations'
}

{ #category : 'selection' }
MQRelationAllTypesStrategy >> selectPropertiesIn: anEntity [

	^ anEntity class mooseDescription allRelationProperties
]
