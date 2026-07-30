Extension { #name : 'FamixTWithTraits' }

{ #category : '*Famix-Deprecated' }
FamixTWithTraits >> traitsGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv traitsGroup' -> '`@rcv traits asMooseSpecializedGroup'.
	^ self traits asMooseSpecializedGroup
]
