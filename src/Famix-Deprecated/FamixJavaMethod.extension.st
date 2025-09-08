Extension { #name : 'FamixJavaMethod' }

{ #category : '*Famix-Deprecated' }
FamixJavaMethod >> isInstanciationInitializer [

	self deprecated: 'Use #isInitializationBlock instead.' transformWith: '`@rcv isInstanciationInitializer' -> '`@rcv isInitializationBlock '.
	^ self isInitializationBlock
]
