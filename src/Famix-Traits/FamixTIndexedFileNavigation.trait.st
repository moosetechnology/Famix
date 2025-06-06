"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `correspondingFile` | `FamixTFile` | nil | File associated to this source anchor|
| `encoding` | `String` | nil | A string representing the encoding of a file|
| `endPos` | `Number` | nil | Stop position in the source|
| `fileName` | `String` | nil | Name of the source file|
| `startPos` | `Number` | nil | Start position in the source|

"
Trait {
	#name : #FamixTIndexedFileNavigation,
	#instVars : [
		'#endPos => FMProperty',
		'#startPos => FMProperty'
	],
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTIndexedFileNavigation classSide >> annotation [

	<FMClass: #TIndexedFileNavigation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #'instance creation' }
FamixTIndexedFileNavigation classSide >> fileName: aString startPos: anInteger endPos: anotherInteger [
	^ self new
		fileName: aString;
		startPos: anInteger;
		endPos: anotherInteger;
		yourself
]

{ #category : #'instance creation' }
FamixTIndexedFileNavigation classSide >> fileName: aString startPos: anInteger endPos: anotherInteger model: aMooseModel [
	^ self new
		mooseModel: aMooseModel;
		fileName: aString;
		startPos: anInteger;
		endPos: anotherInteger;
		yourself
]

{ #category : #visitor }
FamixTIndexedFileNavigation >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTIndexedFileNavigation: self
]

{ #category : #private }
FamixTIndexedFileNavigation >> countNumberOfLinesRuturnsFrom: aStream from: start to: end [
	"Here is a speedup version of the #lineCount method for the IndexedFileAnchors.
	If we have the file of the entity, instead of reading the full file we can jump directly to the startPos in the stream of the file and read the characters until the endPos. 
	If it is a cr we increment a counter and we ignore a potential lf to manage crlf. If this is a lf, we increment."

	| count char |
	count := 1.
	"Go to the start position in the stream"
	1 to: start - 1 do: [ :i | aStream next ].
	[ aStream position < end ]
		whileTrue: [ 
			(char := aStream next) isCr
				ifTrue: [ "We increment the counter if it is a CR and we ignore a potential LF to manage CRLF"
					count := count + 1.
					(char := aStream peek) isLf
						ifTrue: [ aStream next ] ]
				ifFalse: [ char isLf
						ifTrue: [ "Since we manage CRLF before we can just increment the counter" count := count + 1 ] ] ].
	^ count
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> endLine [
	^ self cacheAt: #endLine ifAbsentPut: [ self completeText lineNumberCorrespondingToIndex: self endPos ]
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	<FMComment: 'Stop position in the source'>
	^ endPos
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #testing }
FamixTIndexedFileNavigation >> isWithin: aFileAnchor [
	"Test whether aSourceAnchor is contained within receiver. We test the positions before the file name because it is faster."

	^ startPos >= aFileAnchor startPos and: [ endPos <= aFileAnchor endPos and: [ fileName = aFileAnchor fileName ] ]
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> lineCount [
	^ self lineCountFromFileReference: self fileReference
]

{ #category : #private }
FamixTIndexedFileNavigation >> lineCountFromFileReference: file [
	^ file
		ifExists: [ file
				binaryReadStreamDo: [ :in | 
					| stream |
					stream := ZnCharacterReadStream on: in encoding: self encoding.
					self countNumberOfLinesRuturnsFrom: stream from: (startPos ifNil: [ 1 ]) to: (self endPos ifNil: [ in size ]) ] ]
		ifAbsent: [ self privateLineCount ]
]

{ #category : #printing }
FamixTIndexedFileNavigation >> mooseNameOn: aStream [
	super mooseNameOn: aStream.
	aStream
		nextPut: $(;
		nextPut: $(;
		nextPutAll: self startPos asString;
		nextPut: $-;
		nextPutAll: self endPos asString;
		nextPut: $)
]

{ #category : #private }
FamixTIndexedFileNavigation >> sourceText [
	| start |
	self sourcesAreReadable ifFalse: [ ^ '' ].
	
	start := startPos ifNil: [ 1 ].
	
	^ self fileReference
		binaryReadStreamDo: [ :in | 
			| stream |
			stream := ZnCharacterReadStream on: in encoding: self encoding.
			1 to: start - 1 do: [ :i | stream next ].
			stream next: (endPos ifNil: [ in size + 1 ]) - start + 1 ]
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> startLine [
	^ self cacheAt: #startLine ifAbsentPut: [ self completeText lineNumberCorrespondingToIndex: self startPos ]
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	<FMComment: 'Start position in the source'>
	^ startPos
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> startPos: anObject [
	<generated>
	startPos := anObject
]
