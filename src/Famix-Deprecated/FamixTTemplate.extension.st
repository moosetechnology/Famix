Extension { #name : 'FamixTTemplate' }

{ #category : '*Famix-Deprecated' }
FamixTTemplate >> templateOwnerGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv templateOwnerGroup' -> '`@rcv templateOwner asMooseSpecializedGroup'.
	^ self templateOwner asMooseSpecializedGroup
]
