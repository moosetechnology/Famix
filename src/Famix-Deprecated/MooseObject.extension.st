Extension { #name : 'MooseObject' }

{ #category : '*Famix-Deprecated' }
MooseObject >> lookUpPropertyNamed: selector computedAs: aBlock [

	self
		deprecated: 'Use #cacheAt:ifAbsent: instead.'
		transformWith: '`@rcv lookUpPropertyNamed: `@arg1 computedAs: `@arg2' -> '`@rcv cacheAt: `@arg1 ifAbsent: `@arg2'.
	^ self cacheAt: selector ifAbsentPut: aBlock
]

{ #category : '*Famix-Deprecated' }
MooseObject >> properties [

	self deprecated: 'Use #allCachedValues' transformWith: '`@rcv properties' -> '`@rcv allCachedValues'.
	^ self allCachedValues
]

{ #category : '*Famix-Deprecated' }
MooseObject >> propertyNamed: propertyName [
	"Returns the value of the property named propertyName, raises an error if the property does not exist"

	self deprecated: 'Use #cacheAt: instead.' transformWith: '`@rcv propertyNamed: `@arg1' -> '`@rcv cacheAt: `@arg1'.

	^ self cacheAt: propertyName ifAbsent: [ NotFound signalFor: 'Property named ' , propertyName ]
]

{ #category : '*Famix-Deprecated' }
MooseObject >> propertyNamed: propertyName ifAbsent: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	self deprecated: 'Use #cacheAt:ifAbsent: instead.' transformWith: '`@rcv propertyNamed: `@arg1 ifAbsent: `@arg2' -> '`@rcv cacheAt: `@arg1 ifAbsent: `@arg2'.
	^ self cacheAt: propertyName asSymbol ifAbsent: [ aBlock value ]
]

{ #category : '*Famix-Deprecated' }
MooseObject >> propertyNamed: name ifAbsentPut: value [

	self
		deprecated: 'Use #cacheAt:ifAbsentPut: instead.'
		transformWith: '`@rcv propertyNamed: `@arg1 ifAbsentPut: `@arg2' -> '`@rcv cacheAt: `@arg1 ifAbsentPut: `@arg2'.
	^ self cacheAt: name ifAbsentPut: value
]

{ #category : '*Famix-Deprecated' }
MooseObject >> propertyNamed: propertyName ifNil: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	self deprecated: 'Use #cacheAt:ifAbsent: instead.' transformWith: '`@rcv propertyNamed: `@arg1 ifNil: `@arg2' -> '`@rcv cacheAt: `@arg1 ifAbsent: `@arg2'.

	^ self cacheAt: propertyName asSymbol ifAbsent: [ aBlock value ]
]

{ #category : '*Famix-Deprecated' }
MooseObject >> propertyNamed: name put: value [

	self deprecated: 'Use #cacheAt:put: instead.' transformWith: '`@rcv propertyNamed: `@arg1 put: `@arg2' -> '`@rcv cacheAt: `@arg1 put: `@arg2'.
	^ self cacheAt: name put: value
]
