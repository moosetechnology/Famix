Extension { #name : 'FamixTLambda' }

{ #category : '*Famix-Deprecated' }
FamixTLambda >> lambdaContainerGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv lambdaContainerGroup' -> '`@rcv lambdaContainer asMooseSpecializedGroup'.
	^ self lambdaContainer asMooseSpecializedGroup
]
