Extension { #name : #FamixTWithImports }

{ #category : #'*Famix-Deprecated' }
FamixTWithImports >> addOutgoingImport: anObject [

	self
		deprecated: 'Use #addImport:'
		transformWith:
		'`@receiver addOutgoingImport: `@argument' -> '`@receiver addImport: `@argument'.

	^ self addImport: anObject
]

{ #category : #'*Famix-Deprecated' }
FamixTWithImports >> outgoingImports [

	self
		deprecated: 'Use #imports'
		transformWith:
		'`@receiver outgoingImports' -> '`@receiver imports'.

	^ self imports
]

{ #category : #'*Famix-Deprecated' }
FamixTWithImports >> outgoingImports: anObject [

	self
		deprecated: 'Use #imports:'
		transformWith:
		'`@receiver outgoingImports: `@argument' -> '`@receiver imports: `@argument'.

	^ self imports: anObject
]
