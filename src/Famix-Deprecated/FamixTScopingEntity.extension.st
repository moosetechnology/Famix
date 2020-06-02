Extension { #name : #FamixTScopingEntity }

{ #category : #'*Famix-Deprecated' }
FamixTScopingEntity >> allParentScopesDo: aBlock [
	self deprecated: 'This will be removed'.
	self parentScope ifNotNil: [ :ps | ps withAllParentScopesDo: aBlock ]
]

{ #category : #'*Famix-Deprecated' }
FamixTScopingEntity >> withAllParentScopes [
	| result |
	self deprecated: 'This will be removed'.
	result := OrderedCollection new.
	self withAllParentScopesDo: [ :each | result add: each].
	^ result 
]

{ #category : #'*Famix-Deprecated' }
FamixTScopingEntity >> withAllParentScopesDo: aBlock [
	self deprecated: 'This will be removed'.
	aBlock value: self.
	self allParentScopesDo: aBlock
]
