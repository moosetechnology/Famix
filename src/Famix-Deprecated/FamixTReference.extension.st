Extension { #name : #FamixTReference }

{ #category : #'*Famix-Deprecated' }
FamixTReference >> referredType [

	self deprecated: 'Use #referredEntity instead' transformWith: '`@rcv referredType' -> '`@rcv referredEntity'.
	^ self referredEntity
]

{ #category : #'*Famix-Deprecated' }
FamixTReference >> referredType: anObject [

	self deprecated: 'Use #referredEntity: instead' transformWith: '`@rcv referredType: `@arg' -> '`@rcv referredEntity: `@arg'.
	^ self referredEntity: anObject
]
