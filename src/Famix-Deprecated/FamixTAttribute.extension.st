Extension { #name : 'FamixTAttribute' }

{ #category : '*Famix-Deprecated' }
FamixTAttribute >> parentTypeGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentTypeGroup' -> '`@rcv parentType asMooseSpecializedGroup'.
	^ self parentType asMooseSpecializedGroup
]
