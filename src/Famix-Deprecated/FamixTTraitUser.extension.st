Extension { #name : #FamixTTraitUser }

{ #category : #'*Famix-Deprecated' }
FamixTTraitUser >> addOutgoingTraitUsage: anObject [

	self
		deprecated: 'Use #addTraitUsage:'
		transformWith: '`@receiver addOutgoingTraitUsage: `@argument'
			-> '`@receiver addTraitUsage: `@argument'.

	^ self addTraitUsage: anObject
]

{ #category : #'*Famix-Deprecated' }
FamixTTraitUser >> outgoingTraitUsages [

	self
		deprecated: 'Use #traitUsages'
		transformWith:
		'`@receiver outgoingTraitUsages' -> '`@receiver traitUsages'.

	^ self traitUsages
]

{ #category : #'*Famix-Deprecated' }
FamixTTraitUser >> outgoingTraitUsages: anObject [

	self
		deprecated: 'Use #traitUsages:'
		transformWith: '`@receiver outgoingTraitUsages: `@argument'
			-> '`@receiver traitUsages: `@argument'.

	^ self traitUsages: anObject
]
