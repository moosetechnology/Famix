Extension { #name : 'FamixTWithFunctions' }

{ #category : '*Famix-Deprecated' }
FamixTWithFunctions >> functionsGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv functionsGroup' -> '`@rcv functions asMooseSpecializedGroup'.
	^ self functions asMooseSpecializedGroup
]
