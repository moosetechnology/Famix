Extension { #name : 'MooseObject' }

{ #category : '*Famix-Deprecated' }
MooseObject >> propertyNamed: name ifAbsentPut: value [

	self
		deprecated: 'Use #cacheAt:ifAbsentPut: instead.'
		transformWith: '`@rcv propertyNamed: `@arg1 ifAbsentPut: `@arg2' -> '`@rcv cacheAt: `@arg1 ifAbsentPut: `@arg2'.
	^ self cacheAt: name ifAbsentPut: value
]

{ #category : '*Famix-Deprecated' }
MooseObject >> propertyNamed: name put: value [

	self deprecated: 'Use #cacheAt:put: instead.' transformWith: '`@rcv propertyNamed: `@arg1 put: `@arg2' -> '`@rcv cacheAt: `@arg1 put: `@arg2'.
	^ self cacheAt: name put: value
]
