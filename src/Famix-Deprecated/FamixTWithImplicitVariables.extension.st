Extension { #name : 'FamixTWithImplicitVariables' }

{ #category : '*Famix-Deprecated' }
FamixTWithImplicitVariables >> implicitVariablesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv implicitVariablesGroup' -> '`@rcv implicitVariables asMooseSpecializedGroup'.
	^ self implicitVariables asMooseSpecializedGroup
]
