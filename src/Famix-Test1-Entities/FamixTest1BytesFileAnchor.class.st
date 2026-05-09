"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `correspondingFile` | `FamixTFile` | nil | File associated to this source anchor|
| `encoding` | `String` | nil | A string representing the encoding of a file|
| `endByte` | `Number` | nil | Stop position in the source in number of bytes|
| `fileName` | `String` | nil | Name of the source file|
| `startByte` | `Number` | nil | Start position in the source in number of bytes|

"
Class {
	#name : 'FamixTest1BytesFileAnchor',
	#superclass : 'FamixTest1SourceAnchor',
	#traits : 'FamixTBytesFileAnchor',
	#classTraits : 'FamixTBytesFileAnchor classTrait',
	#category : 'Famix-Test1-Entities-Entities',
	#package : 'Famix-Test1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest1BytesFileAnchor class >> annotation [

	<FMClass: #BytesFileAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
]
