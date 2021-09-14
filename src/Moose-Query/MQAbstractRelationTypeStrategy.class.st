"
Description
--------------------

I am a strategy used by the relation queries to define which kind of entity the query should collect.
"
Class {
	#name : #MQAbstractRelationTypeStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Relations'
}

{ #category : #selection }
MQAbstractRelationTypeStrategy >> selectPropertiesIn: anEntity [

	^ self subclassResponsibility
]
