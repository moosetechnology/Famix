"
Description
--------------------

I am an abstract class to factorise the behavior of MooseQuery queries.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	receiver:		<anEntity>			Receiver of the query.
	result:		<aCollection>		Result the query should return.

"
Class {
	#name : #MQAbstractQuery,
	#superclass : #Object,
	#instVars : [
		'result',
		'receiver'
	],
	#category : #'Moose-Query-Core'
}

{ #category : #execution }
MQAbstractQuery >> execute [
	self subclassResponsibility
]

{ #category : #initialization }
MQAbstractQuery >> initialize [
	super initialize.
	result := Set new
]

{ #category : #accessing }
MQAbstractQuery >> receiver [
	^ receiver
]

{ #category : #accessing }
MQAbstractQuery >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
MQAbstractQuery >> result [
	^ result
]

{ #category : #accessing }
MQAbstractQuery >> result: anObject [
	result := anObject
]
