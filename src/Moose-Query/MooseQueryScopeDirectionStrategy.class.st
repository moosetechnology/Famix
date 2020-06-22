"
Description
--------------------

I am a strategy used by the scoping queries to define the direction in the containment DAG the query should follow.

"
Class {
	#name : #MooseQueryScopeDirectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #query }
MooseQueryScopeDirectionStrategy class >> scopeFor: anEntity query: aQuery [
	^ aQuery scopeFor: anEntity direction: self
]

{ #category : #accessing }
MooseQueryScopeDirectionStrategy class >> selectorsFor: anEntity [
	^ self subclassResponsibility
]
