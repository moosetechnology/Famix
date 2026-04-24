Extension { #name : 'FamixTWithComments' }

{ #category : '*Famix-Deprecated' }
FamixTWithComments >> commentsGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv commentsGroup' -> '`@rcv comments asMooseSpecializedGroup'.
	^ self comments asMooseSpecializedGroup
]
