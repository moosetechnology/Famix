Extension { #name : 'FamixTWithLambdas' }

{ #category : '*Famix-Deprecated' }
FamixTWithLambdas >> lambdasGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv lambdasGroup' -> '`@rcv lambdas asMooseSpecializedGroup'.
	^ self lambdas asMooseSpecializedGroup
]
