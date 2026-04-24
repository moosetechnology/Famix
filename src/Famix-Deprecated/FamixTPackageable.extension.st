Extension { #name : 'FamixTPackageable' }

{ #category : '*Famix-Deprecated' }
FamixTPackageable >> parentPackageGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentPackageGroup' -> '`@rcv parentPackage asMooseSpecializedGroup'.
	^ self parentPackage asMooseSpecializedGroup
]
