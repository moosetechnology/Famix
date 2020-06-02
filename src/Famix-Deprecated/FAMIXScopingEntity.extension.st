Extension { #name : #FAMIXScopingEntity }

{ #category : #'*Famix-Deprecated' }
FAMIXScopingEntity >> allParentScopesDo: aBlock [
	self parentScope ifNotNil: [ :ps | ps withAllParentScopesDo: aBlock ]
]

{ #category : #'*Famix-Deprecated' }
FAMIXScopingEntity >> root [
	^ self isRoot 
		ifTrue: [ self ]
		ifFalse: [ ^ self parentScope root ]
]

{ #category : #'*Famix-Deprecated' }
FAMIXScopingEntity >> withAllChildScopes [
	| result |
	result := OrderedCollection new.
	self withAllChildScopesDo: [ :each | result add: each].
	^ result 
]

{ #category : #'*Famix-Deprecated' }
FAMIXScopingEntity >> withAllChildScopesDo: aBlock [
	aBlock value: self.
	self allChildScopesDo: aBlock
]
