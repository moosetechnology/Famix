"
Description
--------------------

I am a strategy used by the relation queries to define the query should match any of the kind of relations I am parametrized with.
"
Class {
	#name : #MQRelationMultipleTypesStrategy,
	#superclass : #MQAbstractRelationStrategy,
	#instVars : [
		'propertyTypes'
	],
	#category : #'Moose-Query-Relations'
}

{ #category : #accessing }
MQRelationMultipleTypesStrategy class >> propertyTypes: aCollection [

	^ self new
		  propertyTypes: aCollection;
		  yourself
]

{ #category : #accessing }
MQRelationMultipleTypesStrategy >> propertyTypes: anObject [

	propertyTypes := anObject
]

{ #category : #selection }
MQRelationMultipleTypesStrategy >> selectPropertiesIn: anEntity [

	^ anEntity class mooseDescription allRelationProperties select: [ 
		  :property | 
		  propertyTypes anySatisfy: [ :wantedType | 
			  wantedType isOfType: property type implementingClass ] ]
]
