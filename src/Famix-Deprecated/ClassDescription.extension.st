Extension { #name : 'ClassDescription' }

{ #category : '*Famix-Deprecated' }
ClassDescription >> asMooseDescription [

	self deprecated: 'Use #asMetadescription instead' transformWith: '`@rcv asMooseDescription' -> '`@rcv asMetadescription'.
	^ self asMetadescription
]
