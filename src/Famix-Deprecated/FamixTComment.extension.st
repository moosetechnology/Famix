Extension { #name : 'FamixTComment' }

{ #category : '*Famix-Deprecated' }
FamixTComment >> commentedEntityGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv commentedEntityGroup' -> '`@rcv commentedEntity asMooseSpecializedGroup'.
	^ self commentedEntity asMooseSpecializedGroup
]
