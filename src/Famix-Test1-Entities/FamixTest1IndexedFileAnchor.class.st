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
