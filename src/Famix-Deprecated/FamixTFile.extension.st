Extension { #name : 'FamixTFile' }

{ #category : '*Famix-Deprecated' }
FamixTFile >> entitiesGroup [

	self deprecated:
		'This method was used in old Moose interfaces but is not used anymore and is probably dead code. If you use it, contact the Moose team to ask the removal of the deprecation.'.

	^ MooseGroup withAll: self entities withDescription: 'Entities defined in a file'
]

{ #category : '*Famix-Deprecated' }
FamixTFile >> parentFolderGroup [
	self deprecated: 'Use #asMooseSpecializedGroup instead.' transformWith: '`@rcv parentFolderGroup' -> '`@rcv parentFolder asMooseSpecializedGroup'.
	^ self parentFolder asMooseSpecializedGroup
]
