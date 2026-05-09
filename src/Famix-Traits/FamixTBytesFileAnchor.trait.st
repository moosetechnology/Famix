"
I am a file anchor that saves the position of the source code in the file using the start byte and end byte in the file. I will need to detect the encoder of the file and decode the bytes in between the positions to read the source text.

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
Trait {
	#name : 'FamixTBytesFileAnchor',
	#instVars : [
		'#startByte => FMProperty',
		'#endByte => FMProperty'
	],
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : 'Famix-Traits-SourceAnchor',
	#package : 'Famix-Traits',
	#tag : 'SourceAnchor'
}

{ #category : 'meta' }
FamixTBytesFileAnchor classSide >> annotation [

	<FMClass: #TBytesFileAnchor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'visitor' }
FamixTBytesFileAnchor >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTBytesFileAnchor: self
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> endByte [

	<FMProperty: #endByte type: #Number>
	<generated>
	<FMComment: 'Stop position in the source in number of bytes'>
	^ endByte
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> endByte: anObject [
	<generated>
	endByte := anObject
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> endLine [
	^ self cacheAt: #endLine ifAbsentPut: [ self completeText lineNumberCorrespondingToIndex: self endPos ]
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> endPos [

	^ self cacheAt: #endPos ifAbsentPut: [ self startPos + self sourceText size - 1 ]
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> sourceText [

	self sourcesAreReadable ifFalse: [ ^ '' ].

	^ self fileReference binaryReadStreamDo: [ :in |
			  in skip: self startByte - 1.
			  (in next: self endByte - (self startByte - 1)) decodeWith: self encoding ]
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> startByte [

	<FMProperty: #startByte type: #Number>
	<generated>
	<FMComment: 'Start position in the source in number of bytes'>
	^ startByte
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> startByte: anObject [
	<generated>
	startByte := anObject
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> startLine [
	^ self cacheAt: #startLine ifAbsentPut: [ self completeText lineNumberCorrespondingToIndex: self startPos ]
]

{ #category : 'accessing' }
FamixTBytesFileAnchor >> startPos [

	^ self
		  cacheAt: #startPos
		  ifAbsentPut: [ self fileReference binaryReadStreamDo: [ :in | self encoding asZnCharacterEncoder numberOfCharactersFrom: (in next: self startByte) ] ]
]
