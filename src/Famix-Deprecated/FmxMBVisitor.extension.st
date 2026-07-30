Extension { #name : 'FmxMBVisitor' }

{ #category : '*Famix-Deprecated' }
FmxMBVisitor >> visitRelationSide: a [

	self deprecated: 'Use visitRelation:' transformWith: '`@rcv visitRelationSide: `@arg' -> '`@rcv visitRelation: `@arg'.
	^ self visitRelation: a
]
