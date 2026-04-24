Extension { #name : 'FamixTGlobalVariable' }

{ #category : '*Famix-Deprecated' }
FamixTGlobalVariable >> parentScopeGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentScopeGroup' -> '`@rcv parentScope asMooseSpecializedGroup'.
	^ self parentScope asMooseSpecializedGroup
]
