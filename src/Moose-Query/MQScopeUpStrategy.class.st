"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look up in the containment DAG.
"
Class {
	#name : 'MQScopeUpStrategy',
	#superclass : 'MQScopeDirectionStrategy',
	#category : 'Moose-Query-Scoping',
	#package : 'Moose-Query',
	#tag : 'Scoping'
}

{ #category : 'accessing' }
MQScopeUpStrategy class >> selectorsFor: anEntity [
	^ anEntity parentSelectors
]
