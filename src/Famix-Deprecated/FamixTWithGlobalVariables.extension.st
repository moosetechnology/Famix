Extension { #name : 'FamixTWithGlobalVariables' }

{ #category : '*Famix-Deprecated' }
FamixTWithGlobalVariables >> globalVariablesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv globalVariablesGroup' -> '`@rcv globalVariables asMooseSpecializedGroup'.
	^ self globalVariables asMooseSpecializedGroup
]
