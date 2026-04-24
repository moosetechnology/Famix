Extension { #name : 'FamixTImplicitVariable' }

{ #category : '*Famix-Deprecated' }
FamixTImplicitVariable >> parentBehaviouralEntityGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentBehaviouralEntityGroup' -> '`@rcv parentBehaviouralEntity asMooseSpecializedGroup'.
	^ self parentBehaviouralEntity asMooseSpecializedGroup
]
