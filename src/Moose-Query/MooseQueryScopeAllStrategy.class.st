"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look up and down in the containment DAG.
"
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
