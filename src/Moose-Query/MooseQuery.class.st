"
Description
--------------------

I am a class used to creat and execute MooseQuery queries. 

I allow the use of a DSL like: 

method := model allModelMethods anyOne.

method query ancestors for: FamixTNamespace.
method query ancestors recursively for: FamixTNamespace.
method query ancestors recursively forAny: {FamixTNamespace . FamixTClass}.
(method query ancestors recursively until: #isClass) forAny: {FamixTNamespace . FamixTClass}.

method query descendants recursively for: FamixTNamespace.
(method query descendants recursively until: #isClass) forAny: {FamixTNamespace . FamixTClass}.

method query lineage recursively for: FamixTNamespace.
(method query lineage recursively until: #isClass) forAny: {FamixTNamespace . FamixTClass}.

"
Class {
	#name : #MooseQuery,
	#superclass : #Object,
	#instVars : [
		'receiver'
	],
	#category : #'Moose-Query-Core'
}

{ #category : #'instance creation' }
MooseQuery class >> receiver: anEntity [
	^ self new
		receiver: anEntity;
		yourself
]

{ #category : #accessing }
MooseQuery >> ancestors [
	^ MQScopeQuery new
		receiver: receiver;
		direction: MQScopeUpStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> descendants [
	^ MQScopeQuery new
		receiver: receiver;
		direction: MQScopeDownStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> has [
	^ MQNavigationQuery new
		receiver: receiver;
		resultKindStrategy: MQNavigationHasDependencyBooleanKindStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> incoming [
	^ (MQNavigationQuery directionStrategy: MQNavigationIncomingDirectionStrategy)
		receiver: receiver;
		yourself
]

{ #category : #accessing }
MooseQuery >> lineage [
	^ MQScopeQuery new
		receiver: receiver;
		direction: MQScopeAllStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> navigation: aSymbol [
	^ (MQNavigationQuery direction: aSymbol)
		receiver: receiver;
		yourself
]

{ #category : #accessing }
MooseQuery >> outgoing [
	^ (MQNavigationQuery directionStrategy: MQNavigationOutgoingDirectionStrategy)
		receiver: receiver;
		yourself
]

{ #category : #accessing }
MooseQuery >> receiver [
	^ receiver
]

{ #category : #accessing }
MooseQuery >> receiver: anObject [
	receiver := anObject
]
