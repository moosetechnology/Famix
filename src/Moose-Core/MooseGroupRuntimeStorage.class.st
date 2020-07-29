"
I am storing the items of the group during the standard usage of moose entities.

I store the entites for fast access byName and byType. I also contains the all the entities in elements which is not sorted. 

I am used by MooseAbstractGroup subclasses.

Public API and Key Messages

I am managed like a collection and my caches are autoupdated when an entity is added or removed.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	byName:		IdentityHashTable (key: mooseName)
	byType:		Dictionnary of OrderedCollection (key: FAMIXType)  - the orderedCollection is sorted on access
	elements:		OrderedCollection

Implementation Points
- On access by type, OrderedCollections in byType dictionary are sorted by MooseName to find its type faster. This sort is stored in sortedCollectionList and is invalidated on addition of a new element in the collection

I am using an identity hash table to save the names because it is optimized for large collection. The possible loss of performances for small collection is negligeable compared to the gain for large collection. Creating a moose group of 2450080 entities took 6sec+ with anIdentityDictionary and now take 1.6sec+ with a IdentityHashTable.



"
Class {
	#name : #MooseGroupRuntimeStorage,
	#superclass : #MooseGroupStorage,
	#type : #variable,
	#instVars : [
		'byName',
		'elements',
		'byType'
	],
	#category : #'Moose-Core'
}

{ #category : #adding }
MooseGroupRuntimeStorage >> add: anElement [ 
	self privateAdd: anElement.
	self updateCacheOnAddingOf: anElement.
	^anElement
]

{ #category : #adding }
MooseGroupRuntimeStorage >> allEntityTypes [
	^ byType keys
]

{ #category : #accessing }
MooseGroupRuntimeStorage >> at: uniqueName ifAbsent: exceptionBlock [ 
	^byName at: uniqueName asSymbol ifAbsent: exceptionBlock
]

{ #category : #enumerating }
MooseGroupRuntimeStorage >> do: aBlock [ 
	 
	elements do: aBlock
]

{ #category : #accessing }
MooseGroupRuntimeStorage >> elements [ 
	^ elements
]

{ #category : #initialization }
MooseGroupRuntimeStorage >> initialize: capacity [
	byType := IdentityDictionary new: 24.
	byName := IdentityHashTable new: capacity.
	elements := OrderedCollection new: capacity
]

{ #category : #copying }
MooseGroupRuntimeStorage >> postCopy [  
	super postCopy.
	elements := elements copy.
	byName := byName copy.
	byType := byType copy
]

{ #category : #adding }
MooseGroupRuntimeStorage >> privateAdd: anElement [
	^elements add: anElement
]

{ #category : #removing }
MooseGroupRuntimeStorage >> remove: anElement ifAbsent: exceptionBlock [
	self updateCacheOnRemovalOf: anElement.
	elements remove: anElement.
	^ anElement
]

{ #category : #removing }
MooseGroupRuntimeStorage >> removeAll [ 
	 
	self initialize: 10000
]

{ #category : #private }
MooseGroupRuntimeStorage >> resetMooseNameFor: anEntity [
	anEntity hasUniqueMooseNameInModel
		ifTrue: [
			byName removeKey: anEntity mooseName asSymbol ifAbsent: [ ].
			super resetMooseNameFor: anEntity.
			byName at: anEntity mooseName asSymbol put: anEntity ]
		ifFalse: [ super resetMooseNameFor: anEntity ]
]

{ #category : #enumerating }
MooseGroupRuntimeStorage >> selectAllWithType: aSmalltalkType [
	^ byType
		at: aSmalltalkType
		ifAbsent: [ | result |
			result := Set new.
			byType keys
				select: [ :aClass | aClass class = aSmalltalkType ]
				thenDo: [ :aKey | (byType at: aKey) do: [ :anElement | result add: anElement ] ].
			OrderedCollection withAll: result ]
]

{ #category : #accessing }
MooseGroupRuntimeStorage >> size [ 
	^ elements size
]

{ #category : #private }
MooseGroupRuntimeStorage >> updateCacheOnAddingOf: anElement [
	(byType atOrOrederedCollection: anElement class) add: anElement.
	anElement hasUniqueMooseNameInModel ifTrue: [ byName at: anElement mooseName put: anElement ].
	^ anElement
]

{ #category : #private }
MooseGroupRuntimeStorage >> updateCacheOnRemovalOf: anElement [
	byType at: anElement class ifPresent: [ :group |
		group remove: anElement ifAbsent: [ self error: 'Internal storage inconsistency' ] ].

	anElement hasUniqueMooseNameInModel ifFalse: [ ^ anElement ].

	byName
		at: anElement mooseName
		ifAbsent: [ "In theory, objects are registered under their mooseName,
            however some objects are still registered by their name
            if #resetMooseName was not used when needed" self resetMooseNameFor: anElement ].
	byName removeKey: anElement mooseName ifAbsent: [ self error: 'Internal storage inconsistency' ].
	^ anElement
]
