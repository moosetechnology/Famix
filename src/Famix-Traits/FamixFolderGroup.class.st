Class {
	#name : 'FamixFolderGroup',
	#superclass : 'MooseSpecializedGroup',
	#category : 'Famix-Traits-Groups',
	#package : 'Famix-Traits',
	#tag : 'Groups'
}

{ #category : 'accessing - dynamic' }
FamixFolderGroup >> allFiles [
	| files |
	files := OrderedCollection new.
	self do: [ :folder | files addAll: folder files ].
	^ files
]
