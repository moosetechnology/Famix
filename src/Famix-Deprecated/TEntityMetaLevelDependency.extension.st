Extension { #name : 'TEntityMetaLevelDependency' }

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> incomingMSEProperties [

	self deprecated: 'Use #incomingFameProperties instead.' transformWith: '`@rcv incomingMSEProperties' -> '`@rcv incomingFameProperties'.
	^ self incomingFameProperties
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> outgoingMSEProperties [
	"finds all properties from entities of 'self class' to other entities"

	self deprecated: 'Use #outgoingFameProperties instead.' transformWith: '`@rcv outgoingMSEProperties' -> '`@rcv outgoingFameProperties'.
	^ self outgoingFameProperties
]
