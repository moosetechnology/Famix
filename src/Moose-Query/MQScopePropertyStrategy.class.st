Class {
	#name : #MQScopePropertyStrategy,
	#superclass : #MQScopeAbstractTypeStrategy,
	#instVars : [
		'property'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MQScopePropertyStrategy class >> property: anEntity [
	^ self new
		property: anEntity;
		yourself
]

{ #category : #comparing }
MQScopePropertyStrategy >> = anObject [
	^ super = anObject and: [ property = anObject scope ]
]

{ #category : #comparing }
MQScopePropertyStrategy >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: property hash
]

{ #category : #accessing }
MQScopePropertyStrategy >> isOfRightType: anEntity [
	^ [ anEntity perform: self property ]
		on: MessageNotUnderstood
		do: [ false ]
]

{ #category : #accessing }
MQScopePropertyStrategy >> property [
	^ property
]

{ #category : #accessing }
MQScopePropertyStrategy >> property: anObject [
	property := anObject
]
