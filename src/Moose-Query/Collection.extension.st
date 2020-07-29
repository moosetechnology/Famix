Extension { #name : #Collection }

{ #category : #'*Moose-Query' }
Collection >> isIncludedIn: anEntity parentSelectorsCache: aCollection [
	"Use dispatch on entities or collections for performance reasons."

	^ self anySatisfy: [ :each | each isIncludedIn: anEntity parentSelectorsCache: aCollection ]
]

{ #category : #'*Moose-Query' }
Collection >> scopeForQuery: aQuery direction: aDirection [
	1 to: self size do: [ :ind | aDirection scopeFor: (self at: ind) query: aQuery ]
]
