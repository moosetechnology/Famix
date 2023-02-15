Extension { #name : #Object }

{ #category : #'*Famix-Deprecated' }
Object >> mooseDescriptionIn: aMetamodel [

	self
		deprecated:
		'Use aMetamodel descriptionOf: self class instanceSide instad'
		transformWith: '`@receiver mooseDescriptionIn: `@arg'
			-> '`@arg descriptionOf: self class instanceSide'.
	^ aMetamodel fmTypeOf: self class instanceSide
]
