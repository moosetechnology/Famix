"
Description
--------------------

I am a strategy used by the scoping queries to define the query should match any of the kind of entity I am parametrized with.

I am moslty here for performance reasons.
"
Class {
	#name : #MooseQueryScopeTypesStrategy,
	#superclass : #MooseQueryScopeAbstractTypeStrategy,
	#instVars : [
		'scopes'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MooseQueryScopeTypesStrategy class >> scopes: aCollection [
	^ self new
		scopes: aCollection;
		yourself
]

{ #category : #testing }
MooseQueryScopeTypesStrategy >> isOfRightType: anEntity [
	^ scopes anySatisfy: [ :aType | anEntity isOfType: aType ]
]

{ #category : #accessing }
MooseQueryScopeTypesStrategy >> scopes [
	^ scopes
]

{ #category : #accessing }
MooseQueryScopeTypesStrategy >> scopes: anObject [
	scopes := anObject
]
