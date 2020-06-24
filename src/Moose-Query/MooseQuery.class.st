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
	^ MooseQueryScopeQuery new
		receiver: receiver;
		direction: MooseQueryScopeUpStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> descendants [
	^ MooseQueryScopeQuery new
		receiver: receiver;
		direction: MooseQueryScopeDownStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> has [
	^ MooseQueryNavigationQuery new
		receiver: receiver;
		checkPresenceOfDependencies;
		yourself
]

{ #category : #accessing }
MooseQuery >> incoming [
	^ MooseQueryNavigationQuery new
		receiver: receiver;
		directionStrategy: MooseQueryIncomingDirectionStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> lineage [
	^ MooseQueryScopeQuery new
		receiver: receiver;
		direction: MooseQueryScopeAllStrategy;
		yourself
]

{ #category : #accessing }
MooseQuery >> outgoing [
	^ MooseQueryNavigationQuery new
		receiver: receiver;
		directionStrategy: MooseQueryOutgoingDirectionStrategy;
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
