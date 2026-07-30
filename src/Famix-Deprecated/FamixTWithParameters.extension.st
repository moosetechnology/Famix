Extension { #name : 'FamixTWithParameters' }

{ #category : '*Famix-Deprecated' }
FamixTWithParameters >> parametersGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parametersGroup' -> '`@rcv parameters asMooseSpecializedGroup'.
	^ self parameters asMooseSpecializedGroup
]
