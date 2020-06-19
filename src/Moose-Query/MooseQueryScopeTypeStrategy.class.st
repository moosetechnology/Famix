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
