Extension { #name : 'FamixTAnnotationType' }

{ #category : '*Famix-Deprecated' }
FamixTAnnotationType >> annotationTypesContainerGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv annotationTypesContainerGroup' -> '`@rcv annotationTypesContainer asMooseSpecializedGroup'.
	^ self annotationTypesContainer asMooseSpecializedGroup
]
