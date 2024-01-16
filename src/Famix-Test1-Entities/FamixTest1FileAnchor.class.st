"
## Properties
======================

| Name | Type | Comment |
| `correspondingFile` | FamixTFile | File associated to this source anchor|
| `encoding` | String | A string representing the encoding of a file|
| `endColumn` | Number | Number of the end column|
| `endLine` | Number | Number of the end line|
| `fileName` | String | Name of the source file|
| `startColumn` | Number | Number of the start column|
| `startLine` | Number | Number of the start line|

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
