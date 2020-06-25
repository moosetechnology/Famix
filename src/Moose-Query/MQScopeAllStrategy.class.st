"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look up and down in the containment DAG.
"
Class {
	#name : #MQScopeAllStrategy,
	#superclass : #MQScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #query }
MQScopeAllStrategy class >> scopeFor: anEntity query: aQuery [
	MQScopeUpStrategy scopeFor: anEntity query: aQuery.
	MQScopeDownStrategy scopeFor: anEntity query: aQuery.
	^ aQuery result
]

{ #category : #accessing }
MQScopeAllStrategy class >> selectorsFor: anEntity [
	"The all directions strategy should not implement this method since it will call the two other strategies."

	^ self shouldNotImplement
]
