"
Description
--------------------

I am a strategy used by the scoping queries to define the direction in the containment DAG the query should follow.

"
Class {
	#name : 'MQScopeDirectionStrategy',
	#superclass : 'Object',
	#category : 'Moose-Query-Scoping',
	#package : 'Moose-Query',
	#tag : 'Scoping'
}

{ #category : 'testing' }
MQScopeDirectionStrategy class >> isAbstract [
	^ self = MQScopeDirectionStrategy
]

{ #category : 'accessing' }
MQScopeDirectionStrategy class >> selectorsFor: anEntity [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
MQScopeDirectionStrategy class >> strategies [
	^ self allSubclasses reject: #isAbstract
]
