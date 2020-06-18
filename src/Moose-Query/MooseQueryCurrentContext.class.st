Class {
	#name : #MooseQueryCurrentContext,
	#superclass : #DynamicVariable,
	#category : #'Moose-Query-Core'
}

{ #category : #adding }
MooseQueryCurrentContext class >> add: anEntity [
	self value add: anEntity
]

{ #category : #testing }
MooseQueryCurrentContext class >> isOfRightType: anEntity [
	^ self value isOfRightType: anEntity
]

{ #category : #testing }
MooseQueryCurrentContext class >> isRecursive [
	^ self value isRecursive
]

{ #category : #accessing }
MooseQueryCurrentContext class >> result [
	^ self value result
]

{ #category : #testing }
MooseQueryCurrentContext class >> shouldStopOn: anEntity [
	^ self value shouldStopOn: anEntity
]

{ #category : #accessing }
MooseQueryCurrentContext >> default [
	^ MooseQueryContext defaultContext
]
