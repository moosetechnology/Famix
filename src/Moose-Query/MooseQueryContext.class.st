Class {
	#name : #MooseQueryContext,
	#superclass : #Object,
	#instVars : [
		'until',
		'scopes',
		'isRecursive',
		'direction',
		'result'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScope: aFamixType direction: aClass [
	^ self recursivelyScopes: {aFamixType} direction: aClass
]

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScope: aFamixType direction: aClass until: aValuable [
	^ self recursivelyScopes: {aFamixType} direction: aClass until: aValuable
]

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScopes: aCollectionOfType direction: aClass [
	^ (self scopes: aCollectionOfType direction: aClass)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass until: aValuable)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> scope: aFamixType direction: aClass [
	^ self scopes: {aFamixType} direction: aClass
]

{ #category : #'instance creation' }
MooseQueryContext class >> scope: aFamixType direction: aClass until: aValuable [
	^ self scopes: {aFamixType} direction: aClass until: aValuable
]

{ #category : #'instance creation' }
MooseQueryContext class >> scopes: aCollectionOfType direction: aClass [
	^ self new
		scopes: aCollectionOfType;
		direction: aClass;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> scopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #adding }
MooseQueryContext >> add: anEntity [
	self result add: anEntity
]

{ #category : #accessing }
MooseQueryContext >> beRecursive [
	isRecursive := true
]

{ #category : #accessing }
MooseQueryContext >> direction [
	^ direction
]

{ #category : #accessing }
MooseQueryContext >> direction: anObject [
	direction := anObject
]

{ #category : #initialization }
MooseQueryContext >> initialize [
	super initialize.
	isRecursive := false.
	result := OrderedCollection new
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
MooseQueryContext >> result [
	^ result
]

{ #category : #accessing }
MooseQueryContext >> result: anObject [
	result := anObject
]

{ #category : #query }
MooseQueryContext >> scopeFor: anEntity [
	^ direction scopeFor: anEntity query: self
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
