"
Description
--------------------

I am a strategy used by the scoping queries to define on which kind of entity the query should stop. 

I am moslty here for performance reasons.
"
Class {
	#name : #MQScopeAbstractTypeStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #testing }
MQScopeAbstractTypeStrategy class >> isAbstract [
	^ self = MQScopeAbstractTypeStrategy
]

{ #category : #accessing }
MQScopeAbstractTypeStrategy class >> strategies [
	^ self allSubclasses reject: #isAbstract
]

{ #category : #comparing }
MQScopeAbstractTypeStrategy >> = anObject [
	super = anObject ifTrue: [ ^ true ].

	^ self class = anObject class
]

{ #category : #comparing }
MQScopeAbstractTypeStrategy >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash
]

{ #category : #testing }
MQScopeAbstractTypeStrategy >> isOfRightType: anEntity [
	^ self subclassResponsibility
]
