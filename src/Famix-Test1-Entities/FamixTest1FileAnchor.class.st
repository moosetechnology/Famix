"
## Properties
======================

- Named: #correspondingFile Type: FamixTFile Comment: File associated to this source anchor
- Named: #fileName Type: String Comment: Name of the source file
- Named: #startColumn Type: Number Comment: Number of the start column
- Named: #startLine Type: Number Comment: Number of the start line
- Named: #endLine Type: Number Comment: Number of the end line
- Named: #encoding Type: String Comment: A string representing the encoding of a file
- Named: #endColumn Type: Number Comment: Number of the end column

"
Class {
	#name : #FamixTest1FileAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTFileNavigation',
	#classTraits : 'FamixTFileNavigation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1FileAnchor class >> annotation [

	<FMClass: #FileAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
