Class {
	#name : #MooseQueryContext,
	#superclass : #Object,
	#instVars : [
		'until',
		'scopes',
		'isRecursive'
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

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScope: aFamixType [
	^ self recursivelyScopes: {aFamixType}
]

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScope: aFamixType until: aValuable [
	^ self recursivelyScopes: {aFamixType} until: aValuable
]

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScopes: aCollectionOfType [
	^ (self scopes: aCollectionOfType)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScopes: aCollectionOfType until: aValuable [
	^ (self scopes: aCollectionOfType until: aValuable)
		beRecursive;
		yourself
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
	^ (self scopes: aCollectionOfType)
		until: aValuable;
		yourself
]

{ #category : #action }
MooseQueryContext >> beRecursive [
	isRecursive := true
]

{ #category : #initialization }
MooseQueryContext >> initialize [
	super initialize.
	isRecursive := false
]

{ #category : #testing }
MooseQueryContext >> isOfRightType: anEntity [
	^ self scopes anySatisfy: [ :aFAMIXClass | anEntity isOfType: aFAMIXClass ]
]

{ #category : #accessing }
MooseQueryContext >> isRecursive [
	^ isRecursive
]

{ #category : #accessing }
MooseQueryContext >> isRecursive: anObject [
	isRecursive := anObject
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
