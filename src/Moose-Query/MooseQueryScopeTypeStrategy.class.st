"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should match a specific kind of entity.

I am moslty here for performance reasons.
"
Class {
	#name : #MooseQueryScopeTypeStrategy,
	#superclass : #MooseQueryScopeAbstractTypeStrategy,
	#instVars : [
		'scope'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MooseQueryScopeTypeStrategy class >> scope: anEntity [
	^ self new
		scope: anEntity;
		yourself
]

{ #category : #testing }
MooseQueryScopeTypeStrategy >> isOfRightType: anEntity [
	^ anEntity isOfType: scope
]

{ #category : #accessing }
MooseQueryScopeTypeStrategy >> scope [
	^ scope
]

{ #category : #accessing }
MooseQueryScopeTypeStrategy >> scope: anObject [
	scope := anObject
]
