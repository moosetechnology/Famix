"
Description
--------------------

I am a strategy used by the scoping queries to define the direction in the containment DAG the query should follow.

"
Class {
	#name : #MQScopeDirectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #testing }
MQScopeDirectionStrategy class >> isAbstract [
	^ self = MQScopeDirectionStrategy
]

{ #category : #query }
MQScopeDirectionStrategy class >> scopeFor: anEntity query: aQuery [
	^ aQuery scopeFor: anEntity direction: self
]

{ #category : #accessing }
MQScopeDirectionStrategy class >> selectorsFor: anEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
MQScopeDirectionStrategy class >> strategies [
	^ self allSubclasses reject: #isAbstract
]
