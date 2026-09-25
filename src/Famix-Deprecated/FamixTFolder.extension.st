Extension { #name : 'FamixTFolder' }

{ #category : '*Famix-Deprecated' }
FamixTFolder >> childrenFileSystemEntitiesGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv childrenFileSystemEntitiesGroup' -> '`@rcv childrenFileSystemEntities asMooseSpecializedGroup'.
	^ self childrenFileSystemEntities asMooseSpecializedGroup
]

{ #category : '*Famix-Deprecated' }
FamixTFolder >> filesGroup [

	self deprecated:
		'This method was used in old Moose interfaces but is not used anymore and is probably dead code. If you use it, contact the Moose team to ask the removal of the deprecation.'.

	^ FamixFileGroup withAll: self files withDescription: 'Files'
]

{ #category : '*Famix-Deprecated' }
FamixTFolder >> foldersGroup [

	self deprecated:
		'This method was used in old Moose interfaces but is not used anymore and is probably dead code. If you use it, contact the Moose team to ask the removal of the deprecation.'.

	^ FamixFolderGroup withAll: self folders withDescription: 'Folders'
]

{ #category : '*Famix-Deprecated' }
FamixTFolder >> parentFolderGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentFolderGroup' -> '`@rcv parentFolder asMooseSpecializedGroup'.
	^ self parentFolder asMooseSpecializedGroup
]
