Extension { #name : 'FamixTAnnotationInstanceAttribute' }

{ #category : '*Famix-Deprecated' }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstanceGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentAnnotationInstanceGroup' -> '`@rcv parentAnnotationInstance asMooseSpecializedGroup'.
	^ self parentAnnotationInstance asMooseSpecializedGroup
]
