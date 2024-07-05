"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `correspondingFile` | `FamixTFile` | nil | File associated to this source anchor|
| `encoding` | `String` | nil | A string representing the encoding of a file|
| `endColumn` | `Number` | nil | Number of the end column|
| `endLine` | `Number` | nil | Number of the end line|
| `fileName` | `String` | nil | Name of the source file|
| `startColumn` | `Number` | nil | Number of the start column|
| `startLine` | `Number` | nil | Number of the start line|

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
