Extension { #name : 'FamixTWithAttributes' }

{ #category : '*Famix-Deprecated' }
FamixTWithAttributes >> attributesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv attributesGroup' -> '`@rcv attributes asMooseSpecializedGroup'.
	^ self attributes asMooseSpecializedGroup
]
