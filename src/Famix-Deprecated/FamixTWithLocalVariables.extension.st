Extension { #name : 'FamixTWithLocalVariables' }

{ #category : '*Famix-Deprecated' }
FamixTWithLocalVariables >> localVariablesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv localVariablesGroup' -> '`@rcv localVariables asMooseSpecializedGroup'.
	^ self localVariables asMooseSpecializedGroup
]
