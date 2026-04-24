Extension { #name : 'FamixTMethod' }

{ #category : '*Famix-Deprecated' }
FamixTMethod >> parentTypeGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentTypeGroup' -> '`@rcv parentType asMooseSpecializedGroup'.
	^ self parentType asMooseSpecializedGroup
]
