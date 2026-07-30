Extension { #name : 'FamixTWithAnnotationTypes' }

{ #category : '*Famix-Deprecated' }
FamixTWithAnnotationTypes >> definedAnnotationTypesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv definedAnnotationTypesGroup' -> '`@rcv definedAnnotationTypes asMooseSpecializedGroup'.
	^ self definedAnnotationTypes asMooseSpecializedGroup
]
