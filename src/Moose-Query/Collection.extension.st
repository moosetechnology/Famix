Extension { #name : 'Collection' }

{ #category : '*Moose-Query' }
Collection >> isIncludedIn: anEntity containerSelectorsCache: aCollection [
	"Use dispatch on entities or collections for performance reasons."

	^ self anySatisfy: [ :each | each isIncludedIn: anEntity containerSelectorsCache: aCollection ]
]

{ #category : '*Moose-Query' }
Collection >> scopeForQuery: aQuery [

	^ aQuery scopeFor: self
]
