Class {
	#name : #FamixFolderGroup,
	#superclass : #MooseSpecializedGroup,
	#category : #'Famix-Traits-Groups'
}

{ #category : #'accessing - dynamic' }
FamixFolderGroup >> allFiles [
	| files |
	files := OrderedCollection new.
	self do: [ :folder | files addAll: folder files ].
	^ files
]
