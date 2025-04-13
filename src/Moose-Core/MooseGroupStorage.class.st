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
	#name : #MooseGroupStorage,
	#superclass : #Collection,
	#type : #variable,
	#instVars : [
		'elements',
		'byType',
		'species'
	],
	#category : #'Moose-Core'
}

{ #category : #'instance creation' }
MooseGroupStorage class >> empty [
	^ MooseGroupStorage new
]

{ #category : #'instance creation' }
MooseGroupStorage class >> new [ 
	 
	^self basicNew initialize: 1000
]

{ #category : #'instance creation' }
MooseGroupStorage class >> new: capacity [ 
	 
	^self basicNew initialize: capacity
]

{ #category : #'instance creation' }
MooseGroupStorage class >> withAll: aCollection [ 
	" Answer a new instance of this class, 
	whose elements are the elements of aCollection. " 
	 
	| newCollection | 
	newCollection := self new: aCollection size. 
	newCollection addAll: aCollection. 
	^newCollection
]

{ #category : #adding }
MooseGroupStorage >> add: anElement [ 
	self privateAdd: anElement.
	self updateCacheOnAddingOf: anElement.
	^anElement
]

{ #category : #adding }
MooseGroupStorage >> allEntityTypes [
	^ byType keys
]

{ #category : #iterators }
MooseGroupStorage >> basicIterator [
	^ self elements basicIterator
]

{ #category : #enumerating }
MooseGroupStorage >> collect: aBlock [ 
	 
	| newCollection | 
	newCollection := OrderedCollection new: self size. 
	self do: [:each | newCollection add: (aBlock value: each)]. 
	^newCollection
]

{ #category : #enumerating }
MooseGroupStorage >> do: aBlock [ 
	 
	elements do: aBlock
]

{ #category : #accessing }
MooseGroupStorage >> elements [ 
	^ elements
]

{ #category : #testing }
MooseGroupStorage >> includesID: mooseID [ 
	 
	^self anySatisfy: [:each | mooseID == each mooseID]
]

{ #category : #initialization }
MooseGroupStorage >> initialize: capacity [

	byType := IdentityDictionary new: 24.
	species := OrderedCollection.
	elements := self species new: capacity
]

{ #category : #iterators }
MooseGroupStorage >> iterator [
	^ self elements iterator
]

{ #category : #copying }
MooseGroupStorage >> postCopy [

	super postCopy.
	elements := elements copy.
	byType := byType copy
]

{ #category : #adding }
MooseGroupStorage >> privateAdd: anElement [
	^elements add: anElement
]

{ #category : #removing }
MooseGroupStorage >> remove: anElement [ 
	 
	^self 
		remove: anElement 
		ifAbsent: [anElement]
]

{ #category : #removing }
MooseGroupStorage >> remove: anElement ifAbsent: exceptionBlock [
	self updateCacheOnRemovalOf: anElement.
	elements remove: anElement.
	^ anElement
]

{ #category : #removing }
MooseGroupStorage >> removeAll [ 
	 
	self initialize: 10000
]

{ #category : #enumerating }
MooseGroupStorage >> selectAllWithType: aSmalltalkType [
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
MooseGroupStorage >> size [ 
	^ elements size
]

{ #category : #sorting }
MooseGroupStorage >> sort: aBlock [

	self elements sort: aBlock
]

{ #category : #private }
MooseGroupStorage >> species [

	^ species
]

{ #category : #private }
MooseGroupStorage >> species: aCollectionClass [
	species := aCollectionClass.
	^ elements := self species withAll: elements
]

{ #category : #private }
MooseGroupStorage >> updateCacheOnAddingOf: anElement [

	(byType atOrOrederedCollection: anElement class) add: anElement.
	^ anElement
]

{ #category : #private }
MooseGroupStorage >> updateCacheOnRemovalOf: anElement [

	byType at: anElement class ifPresent: [ :group | group remove: anElement ifAbsent: [ self error: 'Internal storage inconsistency' ] ].

	^ anElement
]
