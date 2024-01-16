"
## Properties
======================

| Name | Type | Comment |
| `correspondingFile` | FamixTFile | File associated to this source anchor|
| `encoding` | String | A string representing the encoding of a file|
| `endPos` | Number | Stop position in the source|
| `fileName` | String | Name of the source file|
| `startPos` | Number | Start position in the source|

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
