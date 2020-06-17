Class {
	#name : #MooseQueryContext,
	#superclass : #Object,
	#instVars : [
		'until'
	],
	#classVars : [
		'Default'
	],
	#category : #'Moose-Query-Core'
}

{ #category : #accessing }
MooseQueryContext class >> defaultContext [
	^ Default ifNil: [ Default := self new ]
]

{ #category : #accessing }
MooseQueryContext class >> defaultContext: aContext [
	Default := aContext
]

{ #category : #initialization }
MooseQueryContext class >> resetDefault [
	<script>
	Default := nil
]

{ #category : #'instance creation' }
MooseQueryContext class >> until: aValuable [
	^ self new
		until: aValuable;
		yourself
]

{ #category : #asserting }
MooseQueryContext >> shouldStopOn: anEntity [
	^ self until value: anEntity
]

{ #category : #accessing }
MooseQueryContext >> until [
	^ until ifNil: [ until := [ :each | false ] ]
]

{ #category : #accessing }
MooseQueryContext >> until: anObject [
	until := anObject
]
