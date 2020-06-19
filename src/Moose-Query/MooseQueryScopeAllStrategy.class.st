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
