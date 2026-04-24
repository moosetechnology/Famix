Extension { #name : 'FamixTWithTemplates' }

{ #category : '*Famix-Deprecated' }
FamixTWithTemplates >> templatesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv templatesGroup' -> '`@rcv templates asMooseSpecializedGroup'.
	^ self templates asMooseSpecializedGroup
]
