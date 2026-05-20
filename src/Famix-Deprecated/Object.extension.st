Extension { #name : 'Object' }

{ #category : '*Famix-Deprecated' }
Object >> mooseDescription [

	self deprecated: 'Use #metadescription instead' transformWith: '`@rcv mooseDescription' -> '`@rcv metadescription'.
	^ self metadescription
]
