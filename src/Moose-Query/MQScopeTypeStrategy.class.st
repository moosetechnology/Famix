"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should match a specific kind of entity.

I am moslty here for performance reasons.
"
Class {
	#name : #MQScopeTypeStrategy,
	#superclass : #MQScopeAbstractTypeStrategy,
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

{ #category : #testing }
MQScopeTypeStrategy >> isOfRightType: anEntity [
	^ anEntity isOfType: scope
]

{ #category : #accessing }
MQScopeTypeStrategy >> scope [
	^ scope
]

{ #category : #accessing }
MQScopeTypeStrategy >> scope: anObject [
	scope := anObject
]