Extension { #name : #Collection }

{ #category : #'*Moose-Query' }
Collection >> atScopeInContext: aContext [
	1 to: self size do: [ :ind | aContext atScopeFor: (self at: ind) ].
	^ aContext result
]

{ #category : #'*Moose-Query' }
Collection >> toScopeInContext: aContext [
	1 to: self size do: [ :ind | aContext toScopeFor: (self at: ind) ].
	^ aContext result
]

{ #category : #'*Moose-Query' }
Collection >> withScopeInContext: aContext [
	1 to: self size do: [ :ind | aContext withScopeFor: (self at: ind) ].
	^ aContext result
]
