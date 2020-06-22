Class {
	#name : #MooseQueryContext,
	#superclass : #Object,
	#instVars : [
		'until',
		'isRecursive',
		'direction',
		'result',
		'typeStrategy'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScope: aFamixType direction: aClass [
	^ (self scope: aFamixType direction: aClass)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> recursivelyScope: aFamixType direction: aClass until: aValuable [
	^ (self recursivelyScope: aFamixType direction: aClass)
		until: aValuable;
		yourself
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
	^ self new
		typeStrategy: (MooseQueryScopeTypeStrategy scope: aFamixType);
		direction: aClass;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> scope: aFamixType direction: aClass until: aValuable [
	^ (self scope: aFamixType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #'instance creation' }
MooseQueryContext class >> scopes: aCollectionOfType direction: aClass [
	^ self new
		typeStrategy: (MooseQueryScopeTypesStrategy scopes: aCollectionOfType);
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
	result := Set new
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

{ #category : #query }
MooseQueryContext >> scopeFor: anEntity direction: aDirection [
	| selectors |
	(self typeStrategy isOfRightType: anEntity)
		ifTrue: [ self add: anEntity.
			self isRecursive ifFalse: [ ^ self result ] ].

	"The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
	(self shouldStopOn: anEntity)
		ifFalse: [ 1 to: (selectors := aDirection selectorsFor: anEntity) size do: [ :ind | (anEntity perform: (selectors at: ind)) scopeForQuery: self direction: aDirection ] ].
	^ self result
]

{ #category : #testing }
MooseQueryContext >> shouldStopOn: anEntity [
	^ self until value: anEntity
]

{ #category : #accessing }
MooseQueryContext >> typeStrategy [
	^ typeStrategy
]

{ #category : #accessing }
MooseQueryContext >> typeStrategy: anObject [
	typeStrategy := anObject
]

{ #category : #accessing }
MooseQueryContext >> until [
	^ until ifNil: [ until := [ :each | false ] ]
]

{ #category : #accessing }
MooseQueryContext >> until: anObject [
	until := anObject
]
