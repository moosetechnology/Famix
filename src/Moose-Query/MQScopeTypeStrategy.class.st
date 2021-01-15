"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should match a specific kind of entity.

I am moslty here for performance reasons.
"
Class {
	#name : #MQScopeTypeStrategy,
	#superclass : #MQScopeAbstractStopStrategy,
	#instVars : [
		'scope'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MQScopeTypeStrategy class >> scope: anEntity [
	^ self new
		scope: anEntity;
		yourself
]

{ #category : #comparing }
MQScopeTypeStrategy >> = anObject [
	^ super = anObject and: [ scope = anObject scope ]
]

{ #category : #comparing }
MQScopeTypeStrategy >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: scope hash
]

{ #category : #accessing }
MQScopeTypeStrategy >> scope [
	^ scope
]

{ #category : #accessing }
MQScopeTypeStrategy >> scope: anObject [
	scope := anObject
]

{ #category : #testing }
MQScopeTypeStrategy >> shouldBeSelected: anEntity [
	^ anEntity isOfType: scope
]

{ #category : #printing }
MQScopeTypeStrategy >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' scope: ';
		print: scope;
		nextPut: $)
]
