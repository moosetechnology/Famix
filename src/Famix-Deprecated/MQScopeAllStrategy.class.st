"
Description
--------------------

I am a strategy used by the scoping queries to define that the query should look up and down in the containment DAG.
"
Class {
	#name : 'MQScopeAllStrategy',
	#superclass : 'MQScopeDirectionStrategy',
	#category : 'Famix-Deprecated',
	#package : 'Famix-Deprecated'
}

{ #category : 'testing' }
MQScopeAllStrategy class >> isAbstract [
	"Returning true to remove it from the query browser."

	^ true
]

{ #category : 'testing' }
MQScopeAllStrategy class >> isDeprecated [

	^ true
]

{ #category : 'query' }
MQScopeAllStrategy class >> scopeFor: anEntity query: aQuery [

	self deprecated: 'This feature is removed.'
]

{ #category : 'accessing' }
MQScopeAllStrategy class >> selectorsFor: anEntity [
	"The all directions strategy should not implement this method since it will call the two other strategies."

	^ self shouldNotImplement
]
