Class {
	#name : #MooseQueryAbstractQuery,
	#superclass : #Object,
	#instVars : [
		'result',
		'receiver'
	],
	#category : #'Moose-Query-Core'
}

{ #category : #execution }
MooseQueryAbstractQuery >> execute [
	self subclassResponsibility
]

{ #category : #initialization }
MooseQueryAbstractQuery >> initialize [
	super initialize.
	result := Set new
]

{ #category : #accessing }
MooseQueryAbstractQuery >> receiver [
	^ receiver
]

{ #category : #accessing }
MooseQueryAbstractQuery >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
MooseQueryAbstractQuery >> result [
	^ result
]

{ #category : #accessing }
MooseQueryAbstractQuery >> result: anObject [
	result := anObject
]
