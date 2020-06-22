"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look down in the containment DAG.
"
Class {
	#name : #MooseQueryScopeDownStrategy,
	#superclass : #MooseQueryScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MooseQueryScopeDownStrategy class >> selectorsFor: anEntity [
	^ anEntity childrenSelectors
]
