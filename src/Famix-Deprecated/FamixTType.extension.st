Extension { #name : 'FamixTType' }

{ #category : '*Famix-Deprecated' }
FamixTType >> typeContainerGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv typeContainerGroup' -> '`@rcv typeContainer asMooseSpecializedGroup'.
	^ self typeContainer asMooseSpecializedGroup
]
