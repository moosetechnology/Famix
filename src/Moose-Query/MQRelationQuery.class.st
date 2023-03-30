"
Description
--------------------

I am an object representing a relation query.

A relation query is executed with a receiver and have as parameter:
- The type ofthe opposite side of the relation (a class or trait or collection of those)

Examples
--------------------

For examples check the class comment of MooseQuery.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	receiver:				<anEntity>					The receiver of the query (optional, is used when we call #execute without parameter).
	result:				<aSet>							Set of results found for the query.
	typeStrategy:		<aPropertyTypeStrategy>			A strategy defining the kinds of entities matching the query.

"
Class {
	#name : #MQRelationQuery,
	#superclass : #MQAbstractQuery,
	#instVars : [
		'relationStrategy'
	],
	#category : #'Moose-Query-Relations'
}

{ #category : #execution }
MQRelationQuery >> execute [

	^ ((relationStrategy selectPropertiesIn: receiver) collect: [ :property | 
		   receiver perform: property implementingSelector ]) flattened
]

{ #category : #DSL }
MQRelationQuery >> named: aSymbol [

	relationStrategy := MQRelationByNameStrategy name: aSymbol.
	^ self execute
]

{ #category : #DSL }
MQRelationQuery >> ofAnyType [

	relationStrategy := MQRelationAllTypesStrategy new.
	^ self execute
]

{ #category : #DSL }
MQRelationQuery >> ofAnyType: aCollection [

	relationStrategy := MQRelationMultipleTypesStrategy propertyTypes:
		                aCollection.
	^ self execute
]

{ #category : #DSL }
MQRelationQuery >> ofType: aPropertyType [

	relationStrategy := MQRelationOneTypeStrategy propertyType: aPropertyType.
	^ self execute
]
