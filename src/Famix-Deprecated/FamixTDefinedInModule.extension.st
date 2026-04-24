Extension { #name : 'FamixTDefinedInModule' }

{ #category : '*Famix-Deprecated' }
FamixTDefinedInModule >> parentModuleGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentModuleGroup' -> '`@rcv parentModule asMooseSpecializedGroup'.
	^ self parentModule asMooseSpecializedGroup
]
