"
Description
--------------------

I am a strategy used by the scoping queries to define the query should match any of the kind of entity I am parametrized with.

I am moslty here for performance reasons.
"
Class {
	#name : #MQScopeTypesStrategy,
	#superclass : #MQScopeAbstractStopStrategy,
	#instVars : [
		'scopes'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MQScopeTypesStrategy class >> scopes: aCollection [
	^ self new
		scopes: aCollection;
		yourself
]

{ #category : #comparing }
MQScopeTypesStrategy >> = anObject [
	super = anObject and: [ scopes = anObject scopes ]
]

{ #category : #comparing }
MQScopeTypesStrategy >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: scopes hash
]

{ #category : #accessing }
MQScopeTypesStrategy >> scopes [
	^ scopes
]

{ #category : #accessing }
MQScopeTypesStrategy >> scopes: anObject [
	scopes := anObject
]

{ #category : #testing }
MQScopeTypesStrategy >> shouldBeSelected: anEntity [
	^ scopes anySatisfy: [ :aType | anEntity isOfType: aType ]
]

{ #category : #printing }
MQScopeTypesStrategy >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' scopes: { '.
	scopes do: [ :asso | asso storeOn: aStream ] separatedBy: [ aStream nextPutAll: ' . ' ].
	aStream nextPutAll: '})'
]
