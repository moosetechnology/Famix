Class {
	#name : #MooseQueryScopeAllStrategy,
	#superclass : #MooseQueryScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #query }
MooseQueryScopeAllStrategy class >> scopeFor: anEntity query: aQuery [
	MooseQueryScopeUpStrategy scopeFor: anEntity query: aQuery.
	MooseQueryScopeDownStrategy scopeFor: anEntity query: aQuery.
	^ aQuery result
]

{ #category : #accessing }
MooseQueryScopeAllStrategy class >> selectorsFor: anEntity [
	"The all directions strategy should not implement this method since it will call the two other strategies."

	^ self shouldNotImplement
]
