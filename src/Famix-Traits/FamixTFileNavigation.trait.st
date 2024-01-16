"
## Properties
======================

| Name | Type | Default value | Comment |
| `correspondingFile` | `FamixTFile` | nil | File associated to this source anchor|
| `encoding` | `String` | nil | A string representing the encoding of a file|
| `endColumn` | `Number` | nil | Number of the end column|
| `endLine` | `Number` | nil | Number of the end line|
| `fileName` | `String` | nil | Name of the source file|
| `startColumn` | `Number` | nil | Number of the start column|
| `startLine` | `Number` | nil | Number of the start line|

"
Trait {
	#name : #FamixTFileNavigation,
	#instVars : [
		'#endColumn => FMProperty',
		'#endLine => FMProperty',
		'#startColumn => FMProperty',
		'#startLine => FMProperty'
	],
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTFileNavigation classSide >> annotation [

	<FMClass: #TFileNavigation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #'instance creation' }
FamixTFileNavigation classSide >> fileName: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 [
	^ self 
		fileName: aString
		startLine: anInteger
		startColumn: anInteger2
		endLine: anInteger3
		endColumn: anInteger4
		model: nil
]

{ #category : #'instance creation' }
FamixTFileNavigation classSide >> fileName: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 model: aMooseModel [
	^ self new
		mooseModel: aMooseModel;
		fileName: aString;
		startLine: anInteger;
		startColumn: anInteger2;
		endLine: anInteger3;
		endColumn: anInteger4;
		yourself
]

{ #category : #accessing }
FamixTFileNavigation >> endColumn [

	<FMProperty: #endColumn type: #Number>
	<generated>
	<FMComment: 'Number of the end column'>
	^ endColumn
]

{ #category : #accessing }
FamixTFileNavigation >> endColumn: anObject [
	<generated>
	endColumn := anObject
]

{ #category : #accessing }
FamixTFileNavigation >> endLine [

	<FMProperty: #endLine type: #Number>
	<generated>
	<FMComment: 'Number of the end line'>
	^ endLine
]

{ #category : #accessing }
FamixTFileNavigation >> endLine: anObject [
	<generated>
	endLine := anObject
]

{ #category : #accessing }
FamixTFileNavigation >> endPos [
	^ [ self
		lookUpPropertyNamed: #endPos
		computedAs: [ | text |
			((text := self completeText) intervalOfLine: self endLine - 1) last
				+ (self endColumn ifNil: [ (text lines at: self endLine) size	"In case I do not have any endcolumn." ]) ] ]
		on: SubscriptOutOfBounds
		do: [ :err | 0 ]
]

{ #category : #testing }
FamixTFileNavigation >> endsBefore: aFileAnchor [
	(self endLine isNil or: [ aFileAnchor endLine isNil ]) ifTrue: [ ^ false ].

	(self endColumn isNil or: [ aFileAnchor endColumn isNil ]) ifTrue: [ ^ self endLine <= aFileAnchor endLine ].

	^ self endLine < aFileAnchor endLine or: [ self endLine = aFileAnchor endLine and: [ self endColumn <= aFileAnchor endColumn ] ]
]

{ #category : #accessing }
FamixTFileNavigation >> interval [
	| start end index |
	index := 0.
	start := 1.
	end := 0.
	self completeText
		lineIndicesDo: [ :lineStart :lineEnd :y | 
			index := index + 1.
			self startLine = index ifTrue: [ start := lineStart ].
			self endLine = index ifTrue: [ end := lineEnd ] ].
	^ start to: end
]

{ #category : #testing }
FamixTFileNavigation >> isWithin: aFileAnchor [
	"test whether aSourceAnchor is contained within receiver"

	^ self fileName = aFileAnchor fileName and: [ (self startsAfter: aFileAnchor) and: [ self endsBefore: aFileAnchor ] ]
]

{ #category : #accessing }
FamixTFileNavigation >> lineCount [
	(endLine isNotNil and: [ startLine isNotNil ]) ifTrue: [ ^ endLine - startLine + 1 ].

	"if no start/end position, use the comple text ..."
	^ self hasSource
		ifTrue: [ self completeText lineCount ]
		ifFalse: [ self notExistentMetricValue ]
]

{ #category : #printing }
FamixTFileNavigation >> mooseNameOn: aStream [
	aStream
		nextPutAll: self fileName asString;
		nextPut: $(;
		nextPutAll: self startLine asString;
		nextPut: $@;
		nextPutAll: self startColumn asString;
		nextPut: $-;
		nextPutAll: self endLine asString;
		nextPut: $@;
		nextPutAll: self endColumn asString;
		nextPut: $)
]

{ #category : #accessing }
FamixTFileNavigation >> sourceText [
	(self startLine isNil and: [ self endLine isNil ]) ifTrue: [ ^ self completeText ].
	
	self sourcesAreReadable ifFalse: [ ^ '' ].
	
	^ self fileReference
		binaryReadStreamDo: [ :in | 
			String
				streamContents: [ :s | 
					[ FamixFileAnchorReader readStream: ((ZnCharacterReadStream on: (ZnBufferedReadStream on: in) encoding: self encoding)) for: self into: s ]
						on: MessageNotUnderstood
						do: [ self endLine: nil.
							s ] ] ]
]

{ #category : #accessing }
FamixTFileNavigation >> startColumn [

	<FMProperty: #startColumn type: #Number>
	<generated>
	<FMComment: 'Number of the start column'>
	^ startColumn
]

{ #category : #accessing }
FamixTFileNavigation >> startColumn: anObject [
	<generated>
	startColumn := anObject
]

{ #category : #accessing }
FamixTFileNavigation >> startLine [

	<FMProperty: #startLine type: #Number>
	<generated>
	<FMComment: 'Number of the start line'>
	^ startLine
]

{ #category : #accessing }
FamixTFileNavigation >> startLine: anObject [
	<generated>
	startLine := anObject
]

{ #category : #accessing }
FamixTFileNavigation >> startPos [
	^ self
		lookUpPropertyNamed: #startPos
		computedAs: [ (self completeText
				intervalOfLine:
					(self startLine
						ifNil: [ 1 ]
						ifNotNil: [ :start | start - 1 ])) last + (self startColumn ifNil: [ 0 ]) ]
]

{ #category : #testing }
FamixTFileNavigation >> startsAfter: aFileAnchor [
	 ^ aFileAnchor startBeforeFileAnchor: self
]
