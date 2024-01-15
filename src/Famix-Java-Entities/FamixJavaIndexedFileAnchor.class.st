"
## Properties
======================

- Named: #endPos Type: Number Comment: Stop position in the source
- Named: #startPos Type: Number Comment: Start position in the source
- Named: #correspondingFile Type: FamixTFile Comment: File associated to this source anchor
- Named: #fileName Type: String Comment: Name of the source file
- Named: #encoding Type: String Comment: A string representing the encoding of a file

"
Class {
	#name : #FamixJavaIndexedFileAnchor,
	#superclass : #FamixJavaSourceAnchor,
	#traits : 'FamixTIndexedFileNavigation',
	#classTraits : 'FamixTIndexedFileNavigation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaIndexedFileAnchor class >> annotation [

	<FMClass: #IndexedFileAnchor super: #FamixJavaSourceAnchor>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
