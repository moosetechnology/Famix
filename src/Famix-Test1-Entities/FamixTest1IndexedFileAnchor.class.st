"
## Properties
======================

- Named: #correspondingFile Type: FamixTFile Comment: File associated to this source anchor
- Named: #encoding Type: String Comment: A string representing the encoding of a file
- Named: #endPos Type: Number Comment: Stop position in the source
- Named: #fileName Type: String Comment: Name of the source file
- Named: #startPos Type: Number Comment: Start position in the source

"
Class {
	#name : #FamixTest1IndexedFileAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTIndexedFileNavigation',
	#classTraits : 'FamixTIndexedFileNavigation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1IndexedFileAnchor class >> annotation [

	<FMClass: #IndexedFileAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
