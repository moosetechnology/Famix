Class {
	#name : #MooseQueryContext,
	#superclass : #Object,
	#instVars : [
		'until',
		'scopes'
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
MooseQueryContext class >> scope: aFamixType [
	^ self scopes: {aFamixType}
]

{ #category : #'instance creation' }
MooseQueryContext class >> scope: aFamixType until: aValuable [
	^ self scopes: {aFamixType} until: aValuable
]

{ #category : #'instance creation' }
MooseQueryContext class >> scopes: aCollectionOfType [
	^ self new
		scopes: aCollectionOfType;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> scopes: aCollectionOfType until: aValuable [
	^ self new
		scopes: aCollectionOfType;
		until: aValuable;
		yourself
]

{ #category : #testing }
MooseQueryContext >> isOfRightType: anEntity [
	^ self scopes anySatisfy: [ :aFAMIXClass | anEntity isOfType: aFAMIXClass ]
]

{ #category : #accessing }
MooseQueryContext >> scopes [
	^ scopes
]

{ #category : #accessing }
MooseQueryContext >> scopes: anObject [
	scopes := anObject
]

{ #category : #testing }
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
