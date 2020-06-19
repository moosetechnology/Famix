Extension { #name : #Collection }

{ #category : #'*Moose-Query' }
Collection >> scopeForQuery: aQuery direction: aDirection [
	1 to: self size do: [ :ind | aDirection scopeFor: (self at: ind) query: aQuery ].
	^ aQuery result
]
