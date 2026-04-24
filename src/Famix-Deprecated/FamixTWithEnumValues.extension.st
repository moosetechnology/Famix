Extension { #name : 'FamixTWithEnumValues' }

{ #category : '*Famix-Deprecated' }
FamixTWithEnumValues >> enumValuesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv enumValuesGroup' -> '`@rcv enumValues asMooseSpecializedGroup'.
	^ self enumValues asMooseSpecializedGroup
]
