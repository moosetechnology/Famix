"
Description
--------------------

I am a strategy used by the relation queries to define that the query should match all kinds of relations.
"
Class {
	#name : #MQRelationAllTypesStrategy,
	#superclass : #MQAbstractRelationTypeStrategy,
	#category : #'Moose-Query-Relations'
}

{ #category : #selection }
MQRelationAllTypesStrategy >> selectPropertiesIn: anEntity [

	^ anEntity class mooseDescription allRelationProperties
]
