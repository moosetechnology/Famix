"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look up in the containment DAG. We will consider the containers of the receiver of the query.
"
Class {
	#name : 'MQScopeContainersStrategy',
	#superclass : 'MQScopeDirectionStrategy',
	#category : 'Moose-Query-Scoping',
	#package : 'Moose-Query',
	#tag : 'Scoping'
}

{ #category : 'accessing' }
MQScopeContainersStrategy class >> selectorsFor: anEntity [
	^ anEntity parentSelectors
]
