Extension { #name : #Collection }

{ #category : #'*Moose-Query' }
Collection >> privateAtScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) privateAtScopeIn: MooseQueryCurrentContext result ].
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
Collection >> privateToScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) privateToScopeIn: MooseQueryCurrentContext result ].
	^ MooseQueryCurrentContext result
]

{ #category : #'*Moose-Query' }
Collection >> privateWithScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) privateWithScopeIn: MooseQueryCurrentContext result ].
	^ MooseQueryCurrentContext result
]
