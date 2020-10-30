"
Description
--------------------

I am a strategy used by the scoping queries to define on which kind of entity the query should stop. 

I am moslty here for performance reasons.
"
Class {
	#name : #MQScopeAbstractStopStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #testing }
MQScopeAbstractStopStrategy class >> isAbstract [
	^ self = MQScopeAbstractStopStrategy
]

{ #category : #accessing }
MQScopeAbstractStopStrategy class >> strategies [
	^ self allSubclasses reject: #isAbstract
]

{ #category : #comparing }
MQScopeAbstractStopStrategy >> = anObject [
	super = anObject ifTrue: [ ^ true ].

	^ self class = anObject class
]

{ #category : #comparing }
MQScopeAbstractStopStrategy >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash
]

{ #category : #testing }
MQScopeAbstractStopStrategy >> shouldBeSelected: anEntity [
	^ self subclassResponsibility
]

{ #category : #printing }
MQScopeAbstractStopStrategy >> storeOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' new'
]
