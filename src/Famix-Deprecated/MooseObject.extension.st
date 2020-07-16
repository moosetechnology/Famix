Extension { #name : #MooseObject }

{ #category : #'*Famix-Deprecated' }
MooseObject >> privateState [
	self deprecated: 'The behavior of private state is now directly on MooseObject.' transformWith: '`@receiver privateState' -> '`@receiver'.
	^ self
]
