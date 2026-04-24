Extension { #name : 'FamixTCompilationUnit' }

{ #category : '*Famix-Deprecated' }
FamixTCompilationUnit >> compilationUnitOwnerGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv compilationUnitOwnerGroup' -> '`@rcv compilationUnitOwner asMooseSpecializedGroup'.
	^ self compilationUnitOwner asMooseSpecializedGroup
]
