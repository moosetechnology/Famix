"
I represent the state of a Moose entity.

The state is composed of two main parts:
- The attributes 
- The cache 

Attributes is a collection keeping for a key a certain value. Attributes will never be flushed, they should stay except if the user explicitly remove them!

Cached properties/result is just a cache associating anything to a symbol. This cache should not contain anything that cannot be recomputed because it can be flushed.
"
Class {
	#name : #MooseEntityState,
	#superclass : #Object,
	#instVars : [
		'cache',
		'entityAttributes'
	],
	#category : #'Moose-Core'
}

{ #category : #'accessing cache' }
MooseEntityState >> allCachedValues [
	^ cache values
]

{ #category : #'accessing attributes' }
MooseEntityState >> attributeAt: name ifAbsent: aBlock [
	1 to: entityAttributes size do: [ :n | 
		name == (entityAttributes at: n) key
			ifTrue: [ ^ (entityAttributes at: n) value ] ].
	^ aBlock value
]

{ #category : #'accessing attributes' }
MooseEntityState >> attributeAt: name ifAbsentPut: aBlock [
	1 to: entityAttributes size do: [ :n | 
		name == (entityAttributes at: n) key
			ifTrue: [ ^ (entityAttributes at: n) value ] ].
	entityAttributes := entityAttributes copyWith: name -> aBlock value.
	^ entityAttributes last value
]

{ #category : #'accessing attributes' }
MooseEntityState >> attributeAt: name put: value [
	1 to: entityAttributes size do: [ :n | 
		name == (entityAttributes at: n) key
			ifTrue: [ ^ (entityAttributes at: n) value: value ] ].
	entityAttributes := entityAttributes copyWith: name -> value.
	^ entityAttributes last value
]

{ #category : #'accessing cache' }
MooseEntityState >> cacheAt: name ifAbsent: aBlock [
	^ cache at: name ifAbsent: [ aBlock value ]
]

{ #category : #'accessing cache' }
MooseEntityState >> cacheAt: name ifAbsent: absentBlock ifPresent: presentBlock [
	^ cache at: name ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : #'accessing cache' }
MooseEntityState >> cacheAt: name ifAbsentPut: aBlock [
	^ cache at: name ifAbsentPut: aBlock
]

{ #category : #'accessing cache' }
MooseEntityState >> cacheAt: name ifPresent: aBlock [
	^ cache at: name ifPresent: [ :value | aBlock cull: value ]
]

{ #category : #'accessing cache' }
MooseEntityState >> cacheAt: name ifPresent: presentBlock ifAbsentPut: aBlock [
	^ cache at: name ifPresent: presentBlock ifAbsentPut: aBlock
]

{ #category : #'accessing cache' }
MooseEntityState >> cacheAt: name put: value [
	^ cache at: name put: value
]

{ #category : #accessing }
MooseEntityState >> description: text [
	^ self attributeAt: #privateDescription put: text
]

{ #category : #accessing }
MooseEntityState >> descriptionFor: owner [
	^ self attributeAt: #privateDescription ifAbsent: [ owner mooseName , ' (' , owner mooseDescription name , ')' ]
]

{ #category : #'accessing attributes' }
MooseEntityState >> entityAttributes [
	^ entityAttributes
]

{ #category : #'accessing cache' }
MooseEntityState >> entityCache [
	^ cache
]

{ #category : #controlling }
MooseEntityState >> flush [
	cache initialize
]

{ #category : #testing }
MooseEntityState >> includesKey: selector [
	^ cache includesKey: selector
]

{ #category : #initialization }
MooseEntityState >> initialize [
	super initialize.
	entityAttributes := #().
	cache := SmallDictionary new
]

{ #category : #accessing }
MooseEntityState >> isStub [
	^ self attributeAt: #privateIsStub ifAbsent: [ false ]
]

{ #category : #accessing }
MooseEntityState >> isStub: boolean [ 
	 
	^self attributeAt: #privateIsStub put: boolean
]

{ #category : #'accessing attributes' }
MooseEntityState >> removeAttribute: aSymbol [
	| each |
	1 to: entityAttributes size do: [ :n | 
		aSymbol == (each := entityAttributes at: n) key
			ifTrue: [ entityAttributes := entityAttributes copyWithout: each.
				^ true ] ].
	^ false
]

{ #category : #'accessing cache' }
MooseEntityState >> removeCache: name [
	cache removeKey: name ifAbsent: [  ]
]
