"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look up in the containment DAG.
"
Class {
	#name : #MooseQueryScopeUpStrategy,
	#superclass : #MooseQueryScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MooseQueryScopeUpStrategy class >> selectorsFor: anEntity [
	^ anEntity parentSelectors
]
