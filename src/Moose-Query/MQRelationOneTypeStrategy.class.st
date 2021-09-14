"
Description
--------------------

I am a strategy used by the relation queries to define that the query should match a specific kind of relations.
"
Class {
	#name : #MQRelationOneTypeStrategy,
	#superclass : #MQAbstractRelationTypeStrategy,
	#instVars : [
		'propertyType'
	],
	#category : #'Moose-Query-Relations'
}

{ #category : #accessing }
MQRelationOneTypeStrategy class >> propertyType: aPropertyType [

	^ self new
		  propertyType: aPropertyType;
		  yourself
]

{ #category : #accessing }
MQRelationOneTypeStrategy >> propertyType: anObject [

	propertyType := anObject
]

{ #category : #selection }
MQRelationOneTypeStrategy >> selectPropertiesIn: anEntity [

	^ anEntity mooseDescription allRelationProperties select: [ :relation | 
		  propertyType isOfType: relation type implementingClass ]
]
