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
