Extension { #name : 'FamixTFunction' }

{ #category : '*Famix-Deprecated' }
FamixTFunction >> functionOwnerGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv functionOwnerGroup' -> '`@rcv functionOwner asMooseSpecializedGroup'.
	^ self functionOwner asMooseSpecializedGroup
]
