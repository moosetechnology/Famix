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
