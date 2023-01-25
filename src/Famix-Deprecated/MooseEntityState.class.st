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
	#category : #'Famix-Deprecated'
}

{ #category : #'as yet unclassified' }
MooseEntityState class >> for: aMooseEntity [
	self deprecated: 'Use #new instead.' transformWith: '`@receiver for: `@arg' -> '`@receiver new'.
	^ self new
]

{ #category : #testing }
MooseEntityState class >> isDeprecated [
	"State and behaviour of MooseEntityState is now directly on MooseObject to save lot of memory."

	^ true
]

{ #category : #'as yet unclassified' }
MooseEntityState class >> with: aMooseEntity [
	self deprecated: 'Use #new instead.' transformWith: '`@receiver with: `@arg' -> '`@receiver new'.
	^ self new
]

{ #category : #'accessing cache' }
MooseEntityState >> allCachedValues [
	^ cache values
]

{ #category : #'as yet unclassified' }
MooseEntityState >> allProperties [
	self deprecated: 'Use #allProperties instead' transformWith: '`@receiver allProperties' -> '`@receiver allCachedValues'. 
	^ self allCachedValues
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

{ #category : #'as yet unclassified' }
MooseEntityState >> attributes [
	self deprecated: 'Use #entityAttributes instead' transformWith: '`@receiver attributes' -> '`@receiver entityAttributes'.
	^ self entityAttributes
]

{ #category : #'as yet unclassified' }
MooseEntityState >> cache: selector initializer: aBlock [
	self
		deprecated: 'Uses #cacheAt:ifAbsentPut: instead'
		transformWith: '`@receiver cache: `@arg1 initializer: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsentPut: `@arg2'.
	^ self cacheAt: selector ifAbsentPut: aBlock
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

{ #category : #'as yet unclassified' }
MooseEntityState >> flushGroups [
	self deprecated: 'Use #flush instead' transformWith: '`@receiver flushGroups' -> '`@receiver flush'.
	self flush
]

{ #category : #'as yet unclassified' }
MooseEntityState >> flushProperties [
	self deprecated: 'Use #flush instead' transformWith: '`@receiver flushProperties' -> '`@receiver flush'.
	self flush
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

{ #category : #'as yet unclassified' }
MooseEntityState >> propertyAt: name ifAbsent: aBlock [
	self
		deprecated: 'Use cacheAt:ifAbsent: instead'
		transformWith: '`@receiver propertyAt: `@arg1 ifAbsent: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsent: `@arg2'.
	^ self cacheAt: name ifAbsent: aBlock
]

{ #category : #'as yet unclassified' }
MooseEntityState >> propertyAt: name ifAbsentPut: aBlock [
	self
		deprecated: 'Use cache:ifAbsentPut: instead'
		transformWith: '`@receiver propertyAt: `@arg1 ifAbsentPut: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsentPut: `@arg2'.
	^ self cacheAt: name ifAbsentPut: aBlock
]

{ #category : #'as yet unclassified' }
MooseEntityState >> propertyAt: name put: value [
	self deprecated: 'Use cacheAt:put: instead' transformWith: '`@receiver propertyAt: `@arg1 put: `@arg2' -> '`@receiver cacheAt: `@arg1 put: `@arg2'.
	^ self cacheAt: name put: value
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

{ #category : #'as yet unclassified' }
MooseEntityState >> removeProperty: name [
	self deprecated: 'Use removeCache: instead' transformWith: '`@receiver removeProperty: `@arg' -> '`@receiver removeCache: `@arg'.
	^ self removeCache: name
]
