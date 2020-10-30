"
Description
--------------------

I am a strategy used by the scoping queries to define the query should match any of the entities that satisfy the property selector.

I am moslty here for performance reasons.
"
Class {
	#name : #MQScopePropertyStrategy,
	#superclass : #MQScopeAbstractStopStrategy,
	#instVars : [
		'property'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MQScopePropertyStrategy class >> property: anEntity [
	^ self new
		property: anEntity;
		yourself
]

{ #category : #comparing }
MQScopePropertyStrategy >> = anObject [
	^ super = anObject and: [ property = anObject scope ]
]

{ #category : #comparing }
MQScopePropertyStrategy >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: property hash
]

{ #category : #accessing }
MQScopePropertyStrategy >> property [
	^ property
]

{ #category : #accessing }
MQScopePropertyStrategy >> property: anObject [
	property := anObject
]

{ #category : #accessing }
MQScopePropertyStrategy >> shouldBeSelected: anEntity [
	^ [ self property value: anEntity  ]
		on: Error
		do: [ false ]
]

{ #category : #accessing }
MQScopePropertyStrategy >> storeOn: aStream [
	aStream nextPutAll: self class name.
	aStream nextPutAll: '('.
	property printOn: aStream.
	aStream nextPutAll: ')'.
]
