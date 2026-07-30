Extension { #name : 'FamixTParameter' }

{ #category : '*Famix-Deprecated' }
FamixTParameter >> parentBehaviouralEntityGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentBehaviouralEntityGroup' -> '`@rcv parentBehaviouralEntity asMooseSpecializedGroup'.
	^ self parentBehaviouralEntity asMooseSpecializedGroup
]
