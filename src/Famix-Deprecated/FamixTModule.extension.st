Extension { #name : 'FamixTModule' }

{ #category : '*Famix-Deprecated' }
FamixTModule >> moduleEntitiesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv moduleEntitiesGroup' -> '`@rcv moduleEntities asMooseSpecializedGroup'.
	^ self moduleEntities asMooseSpecializedGroup
]
