"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look down in the containment DAG.
"
Class {
	#name : #MQScopeDownStrategy,
	#superclass : #MQScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MQScopeDownStrategy class >> selectorsFor: anEntity [
	^ anEntity childrenSelectors
]
