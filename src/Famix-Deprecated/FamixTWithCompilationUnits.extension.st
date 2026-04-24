Extension { #name : 'FamixTWithCompilationUnits' }

{ #category : '*Famix-Deprecated' }
FamixTWithCompilationUnits >> compilationUnitGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv compilationUnitGroup' -> '`@rcv compilationUnit asMooseSpecializedGroup'.
	^ self compilationUnit asMooseSpecializedGroup
]
