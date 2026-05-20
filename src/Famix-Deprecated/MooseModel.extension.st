Extension { #name : 'MooseModel' }

{ #category : '*Famix-Deprecated' }
MooseModel >> mooseDescriptionFor: class [

	self deprecated: 'Use #metadescriptionFor: instead' transformWith: '`@rcv mooseDescriptionFor: `@arg' -> '`@rcv metadescriptionFor: `@arg'.

	^ self metadescriptionFor: class
]
