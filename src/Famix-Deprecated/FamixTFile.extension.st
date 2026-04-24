Extension { #name : 'FamixTFile' }

{ #category : '*Famix-Deprecated' }
FamixTFile >> parentFolderGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentFolderGroup' -> '`@rcv parentFolder asMooseSpecializedGroup'.
	^ self parentFolder asMooseSpecializedGroup
]
