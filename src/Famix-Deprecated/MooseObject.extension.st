Extension { #name : #MooseObject }

{ #category : #'*Famix-Deprecated' }
MooseObject >> allProperties [
	self deprecated: 'Use #allProperties instead' transformWith: '`@receiver allProperties' -> '`@receiver allCachedValues'. 
	^ self allCachedValues
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> attributes [
	self deprecated: 'Use #entityAttributes instead' transformWith: '`@receiver attributes' -> '`@receiver entityAttributes'.
	^ self entityAttributes
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> cache: selector initializer: aBlock [
	self
		deprecated: 'Uses #cacheAt:ifAbsentPut: instead'
		transformWith: '`@receiver cache: `@arg1 initializer: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsentPut: `@arg2'.
	^ self cacheAt: selector ifAbsentPut: aBlock
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> flushGroups [
	self deprecated: 'Use #flush instead' transformWith: '`@receiver flushGroups' -> '`@receiver flush'.
	self flush
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> flushProperties [
	self deprecated: 'Use #flush instead' transformWith: '`@receiver flushProperties' -> '`@receiver flush'.
	self flush
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> privateState [
	self deprecated: 'The behavior of private state is now directly on MooseObject.' transformWith: '`@receiver privateState' -> '`@receiver'.
	^ self
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> propertyAt: name ifAbsent: aBlock [
	self
		deprecated: 'Use cacheAt:ifAbsent: instead'
		transformWith: '`@receiver propertyAt: `@arg1 ifAbsent: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsent: `@arg2'.
	^ self cacheAt: name ifAbsent: aBlock
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> propertyAt: name ifAbsentPut: aBlock [
	self
		deprecated: 'Use cache:ifAbsentPut: instead'
		transformWith: '`@receiver propertyAt: `@arg1 ifAbsentPut: `@arg2' -> '`@receiver cacheAt: `@arg1 ifAbsentPut: `@arg2'.
	^ self cacheAt: name ifAbsentPut: aBlock
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> propertyAt: name put: value [
	self deprecated: 'Use cacheAt:put: instead' transformWith: '`@receiver propertyAt: `@arg1 put: `@arg2' -> '`@receiver cacheAt: `@arg1 put: `@arg2'.
	^ self cacheAt: name put: value
]

{ #category : #'*Famix-Deprecated' }
MooseObject >> removeProperty: name [
	self deprecated: 'Use removeCache: instead' transformWith: '`@receiver removeProperty: `@arg' -> '`@receiver removeCache: `@arg'.
	^ self removeCache: name
]
