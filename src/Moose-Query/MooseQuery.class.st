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
MooseQuery >> lineage [
	^ MooseQueryScopeQuery new
		receiver: receiver;
		direction: MooseQueryScopeAllStrategy;
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
