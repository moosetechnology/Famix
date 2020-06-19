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
Collection >> withScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) withScopeIn: MooseQueryCurrentContext result ].
	^ MooseQueryCurrentContext result
]
