Extension { #name : 'FamixTFolder' }

{ #category : '*Famix-Deprecated' }
FamixTFolder >> childrenFileSystemEntitiesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv childrenFileSystemEntitiesGroup' -> '`@rcv childrenFileSystemEntities asMooseSpecializedGroup'.
	^ self childrenFileSystemEntities asMooseSpecializedGroup
]

{ #category : '*Famix-Deprecated' }
FamixTFolder >> parentFolderGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentFolderGroup' -> '`@rcv parentFolder asMooseSpecializedGroup'.
	^ self parentFolder asMooseSpecializedGroup
]
