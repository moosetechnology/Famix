Extension { #name : 'FamixTWithTypes' }

{ #category : '*Famix-Deprecated' }
FamixTWithTypes >> typesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv typesGroup' -> '`@rcv types asMooseSpecializedGroup'.
	^ self types asMooseSpecializedGroup
]
