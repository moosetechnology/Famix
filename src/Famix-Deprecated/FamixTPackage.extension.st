Extension { #name : 'FamixTPackage' }

{ #category : '*Famix-Deprecated' }
FamixTPackage >> childEntitiesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv childEntitiesGroup' -> '`@rcv childEntities asMooseSpecializedGroup'.
	^ self childEntities asMooseSpecializedGroup
]

{ #category : '*Famix-Deprecated' }
FamixTPackage >> numberOfClientPackages: aNumber [

	self deprecated: 'We should not be able to set this metric. We should compute it in Moose.'.
	self cacheAt: #numberOfClientPackages put: aNumber
]
