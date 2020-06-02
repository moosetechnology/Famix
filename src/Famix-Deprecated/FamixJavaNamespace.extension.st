Extension { #name : #FamixJavaNamespace }

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> addChildScope: aScopingEntity [
	self deprecated: 'FamixJavaScopingEntites should not be used anymore. Use the new API.' transformWith: '`@receiver addChildScope: `@arg' -> '`@receiver addChildNamespace: `@arg'.
	^ self addChildNamespace: aScopingEntity
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> allChildScopes [
	| result |
	self deprecated: 'This will be removed because not generic enough. You can instead collect recursivelly #childNamespaces'.
	result := OrderedCollection new.
	self allChildScopesDo: [ :each | result add: each ].
	^ result
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> allChildScopesDo: aBlock [
	self deprecated: 'This will be removed because not generic enough. You can instead collect recursivelly #childNamespaces'.
	self childScopes do: [ :each | each withAllChildScopesDo: aBlock ]
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> allParentScopesDo: aBlock [
	self deprecated: 'This will be removed'.
	self parentScope ifNotNil: [ :ps | ps withAllParentScopesDo: aBlock ]
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> childScopes [
	self deprecated: 'FamixJavaScopingEntites should not be used anymore. Use the new API.' transformWith: '`@receiver childScopes' -> '`@receiver childNamespaces'.
	^ self childNamespaces
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> childScopes: aCollection [
	self
		deprecated: 'FamixJavaScopingEntites should not be used anymore. Use the new API.'
		transformWith: '`@receiver childScopes: `@arg' -> '`@receiver childNamespaces: `@arg'.
	^ self childNamespaces: aCollection
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> childrenOfMyKind [
	self
		deprecated: 'childrenOfMyKind should not be used anymore. Use #childNamespaces instead.'
		transformWith: '`@receiver childrenOfMyKind' -> '`@receiver childNamespaces'.
	^ self childNamespaces
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> parentScope [
	self
		deprecated:  'FamixJavaScopingEntites should not be used anymore. Use the new API.' 
		transformWith: '`@receiver parentScope' -> '`@receiver parentNamespace'.
	^ self parentNamespace
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> parentScope: anEntity [
	self
		deprecated:  'FamixJavaScopingEntites should not be used anymore. Use the new API.' 
		transformWith: '`@receiver parentScope: `@arg' -> '`@receiver parentNamespace: `@arg'.
	^ self parentNamespace: anEntity
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> withAllChildScopes [
	| result |
	self deprecated: 'This will be removed because not generic enough. You can instead collect recursivelly #childNamespaces'.
	result := OrderedCollection new.
	self withAllChildScopesDo: [ :each | result add: each ].
	^ result
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> withAllChildScopesDo: aBlock [
	self deprecated: 'This will be removed because not generic enough. You can instead collect recursivelly #childNamespaces'.
	aBlock value: self.
	self allChildScopesDo: aBlock
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> withAllParentScopes [
	| result |
	self deprecated: 'This will be removed'.
	result := OrderedCollection new.
	self withAllParentScopesDo: [ :each | result add: each].
	^ result 
]

{ #category : #'*Famix-Deprecated' }
FamixJavaNamespace >> withAllParentScopesDo: aBlock [
	self deprecated: 'This will be removed'.
	aBlock value: self.
	self allParentScopesDo: aBlock
]
