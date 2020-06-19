Extension { #name : #Collection }

{ #category : #'*Moose-Query' }
Collection >> atScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) atScopeIn: MooseQueryCurrentContext result ].
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
Collection >> toScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) toScopeIn: MooseQueryCurrentContext result ].
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
Collection >> withScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) withScopeIn: MooseQueryCurrentContext result ].
	^ MooseQueryCurrentContext result
]
