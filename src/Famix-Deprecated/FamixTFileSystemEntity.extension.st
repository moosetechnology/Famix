Extension { #name : 'FamixTFileSystemEntity' }

{ #category : '*Famix-Deprecated' }
FamixTFileSystemEntity >> parentFolderGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentFolderGroup' -> '`@rcv parentFolder asMooseSpecializedGroup'.
	^ self parentFolder asMooseSpecializedGroup
]
