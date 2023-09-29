Class {
	#name : #FamixFolderGroup,
	#superclass : #MooseSpecializedGroup,
	#category : #'Famix-Traits-Groups'
}

{ #category : #meta }
FamixFolderGroup class >> annotation [

	<FMClass: #FolderGroup super: #MooseSpecializedGroup>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #meta }
FamixFolderGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : #'accessing - dynamic' }
FamixFolderGroup >> allFiles [
	| files |
	files := OrderedCollection new.
	self do: [ :folder | files addAll: folder files ].
	^ files
]
