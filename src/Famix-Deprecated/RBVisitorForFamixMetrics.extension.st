Extension { #name : #RBVisitorForFamixMetrics }

{ #category : #'*Famix-Deprecated' }
RBVisitorForFamixMetrics >> processMethod: aMethodEntity usingImporter: anImporter inModel: anObject [
	self
		deprecated: 'Use #processMethod: instead.'
		transformWith: '`@receiver precessMethod: `@arg1 usingImporter: `@arg2 inModel: `@arg3' -> '`@receiver precessMethod: `@arg1'.
	self processMethod: aMethodEntity
]
