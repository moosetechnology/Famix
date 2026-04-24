Extension { #name : 'FamixTTrait' }

{ #category : '*Famix-Deprecated' }
FamixTTrait >> traitOwnerGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv traitOwnerGroup' -> '`@rcv traitOwner asMooseSpecializedGroup'.
	^ self traitOwner asMooseSpecializedGroup
]
