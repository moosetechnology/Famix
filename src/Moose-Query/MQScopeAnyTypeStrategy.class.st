"
Description
--------------------

I am a strategy used by the scoping queries to define the query should match any of the kind of entity I am parametrized with.

I am moslty here for performance reasons.
"
Class {
	#name : 'MQScopeAnyTypeStrategy',
	#superclass : 'MQScopeAbstractStopStrategy',
	#instVars : [
		'scopes'
	],
	#category : 'Moose-Query-Scoping',
	#package : 'Moose-Query',
	#tag : 'Scoping'
}

{ #category : 'accessing' }
MQScopeAnyTypeStrategy class >> scopes: aCollection [
	^ self new
		scopes: aCollection;
		yourself
]

{ #category : 'comparing' }
MQScopeAnyTypeStrategy >> = anObject [
	super = anObject and: [ scopes = anObject scopes ]
]

{ #category : 'comparing' }
MQScopeAnyTypeStrategy >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: scopes hash
]

{ #category : 'accessing' }
MQScopeAnyTypeStrategy >> scopes [
	^ scopes
]

{ #category : 'accessing' }
MQScopeAnyTypeStrategy >> scopes: anObject [
	scopes := anObject
]

{ #category : 'testing' }
MQScopeAnyTypeStrategy >> selectMatchingElements: aCollection [
	"We know that the collection has at least 1 element and that all entities are instances of the same class.
	
	This could be simpler but this code needs to be the fastest possible."

	| class |
	class := (aCollection at: 1) class.
	1 to: scopes size do: [ :index | (class isOfType: (scopes at: index)) ifTrue: [ ^ aCollection ] ].
	^ Array empty
]

{ #category : 'printing' }
MQScopeAnyTypeStrategy >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' scopes: { '.
	scopes do: [ :asso | asso storeOn: aStream ] separatedBy: [ aStream nextPutAll: ' . ' ].
	aStream nextPutAll: '})'
]
