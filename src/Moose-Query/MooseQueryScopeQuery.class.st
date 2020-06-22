Class {
	#name : #MooseQueryScopeQuery,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'until',
		'isRecursive',
		'direction',
		'result',
		'typeStrategy'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> recursivelyScope: aFamixType direction: aClass [
	^ (self scope: aFamixType direction: aClass)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> recursivelyScope: aFamixType direction: aClass until: aValuable [
	^ (self recursivelyScope: aFamixType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> recursivelyScopes: aCollectionOfType direction: aClass [
	^ (self scopes: aCollectionOfType direction: aClass)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> recursivelyScopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass until: aValuable)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> scope: aFamixType direction: aClass [
	^ self new
		typeStrategy: (MooseQueryScopeTypeStrategy scope: aFamixType);
		direction: aClass;
		yourself
]

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> scope: aFamixType direction: aClass until: aValuable [
	^ (self scope: aFamixType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> scopes: aCollectionOfType direction: aClass [
	^ self new
		typeStrategy: (MooseQueryScopeTypesStrategy scopes: aCollectionOfType);
		direction: aClass;
		yourself
]

{ #category : #'instance creation' }
MooseQueryScopeQuery class >> scopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #adding }
MooseQueryScopeQuery >> add: anEntity [
	self result add: anEntity
]

{ #category : #accessing }
MooseQueryScopeQuery >> beRecursive [
	isRecursive := true
]

{ #category : #accessing }
MooseQueryScopeQuery >> direction [
	^ direction
]

{ #category : #accessing }
MooseQueryScopeQuery >> direction: anObject [
	direction := anObject
]

{ #category : #execution }
MooseQueryScopeQuery >> execute [
	^ self scopeFor: self receiver
]

{ #category : #accessing }
MooseQueryScopeQuery >> for: aFamixType [
	typeStrategy := MooseQueryScopeTypeStrategy scope: aFamixType.
	^ self execute
]

{ #category : #accessing }
MooseQueryScopeQuery >> forAny: aCollection [
	typeStrategy := MooseQueryScopeTypesStrategy scopes: aCollection.
	^ self execute
]

{ #category : #initialization }
MooseQueryScopeQuery >> initialize [
	super initialize.
	isRecursive := false.
	result := Set new
]

{ #category : #accessing }
MooseQueryScopeQuery >> isRecursive [
	^ isRecursive
]

{ #category : #accessing }
MooseQueryScopeQuery >> isRecursive: anObject [
	isRecursive := anObject
]

{ #category : #accessing }
MooseQueryScopeQuery >> receiver [
	^ receiver
]

{ #category : #accessing }
MooseQueryScopeQuery >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
MooseQueryScopeQuery >> recursively [
	isRecursive := true
]

{ #category : #accessing }
MooseQueryScopeQuery >> result [
	^ result
]

{ #category : #accessing }
MooseQueryScopeQuery >> result: anObject [
	result := anObject
]

{ #category : #execution }
MooseQueryScopeQuery >> scopeFor: anEntity [
	^ direction scopeFor: anEntity query: self
]

{ #category : #execution }
MooseQueryScopeQuery >> scopeFor: anEntity direction: aDirection [
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
MooseQueryScopeQuery >> shouldStopOn: anEntity [
	^ self until value: anEntity
]

{ #category : #accessing }
MooseQueryScopeQuery >> typeStrategy [
	^ typeStrategy
]

{ #category : #accessing }
MooseQueryScopeQuery >> typeStrategy: anObject [
	typeStrategy := anObject
]

{ #category : #accessing }
MooseQueryScopeQuery >> until [
	^ until ifNil: [ until := [ :each | false ] ]
]

{ #category : #accessing }
MooseQueryScopeQuery >> until: anObject [
	until := anObject
]
