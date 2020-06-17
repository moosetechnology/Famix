Class {
	#name : #MooseQueryCurrentContext,
	#superclass : #DynamicVariable,
	#category : #'Moose-Query-Core'
}

{ #category : #testing }
MooseQueryCurrentContext class >> shouldStopOn: anEntity [
	^ self value shouldStopOn: anEntity
]

{ #category : #accessing }
MooseQueryCurrentContext >> default [
	^ MooseQueryContext defaultContext
]
