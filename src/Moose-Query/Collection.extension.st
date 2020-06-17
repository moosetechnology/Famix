Extension { #name : #Collection }

{ #category : #'*Moose-Query' }
Collection >> allAtAnyScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allAtAnyScopeIn: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> allAtScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allAtScopeIn: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> allToScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allToScopeIn: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> allWithScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) allWithScopeIn: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> atScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) atScopeIn: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> toScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) toScopeIn: aCollection ].
	^ aCollection
]

{ #category : #'*Moose-Query' }
Collection >> withScopeIn: aCollection [
	1 to: self size do: [ :ind | (self at: ind) withScopeIn: aCollection ].
	^ aCollection
]
