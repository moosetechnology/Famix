Extension { #name : 'FamixTEnumValue' }

{ #category : '*Famix-Deprecated' }
FamixTEnumValue >> parentEnumGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentEnumGroup' -> '`@rcv parentEnum asMooseSpecializedGroup'.
	^ self parentEnum asMooseSpecializedGroup
]
