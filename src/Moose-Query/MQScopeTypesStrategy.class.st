"
Description
--------------------

I am a strategy used by the scoping queries to define the query should match any of the kind of entity I am parametrized with.

I am moslty here for performance reasons.
"
Class {
	#name : #MQScopeTypesStrategy,
	#superclass : #MQScopeAbstractTypeStrategy,
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

{ #category : #testing }
MQScopeTypesStrategy >> isOfRightType: anEntity [
	^ scopes anySatisfy: [ :aType | anEntity isOfType: aType ]
]

{ #category : #accessing }
MQScopeTypesStrategy >> scopes [
	^ scopes
]

{ #category : #accessing }
MQScopeTypesStrategy >> scopes: anObject [
	scopes := anObject
]
