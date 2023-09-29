Class {
	#name : #FamixFileAnchorReader,
	#superclass : #Object,
	#instVars : [
		'readStream',
		'writeStream',
		'lineCount',
		'fileAnchor',
		'char',
		'startLine'
	],
	#category : #'Famix-Traits'
}

{ #category : #reading }
FamixFileAnchorReader class >> readStream: aReadStream for: aFAMIXFileAnchor into: aWriteStream [
	^ self new
		readStream: aReadStream;
		writeStream: aWriteStream;
		fileAnchor: aFAMIXFileAnchor;
		read
]

{ #category : #accessing }
FamixFileAnchorReader >> fileAnchor: anObject [
	fileAnchor := anObject
]

{ #category : #reading }
FamixFileAnchorReader >> increment [
	lineCount := lineCount + 1
]

{ #category : #initialization }
FamixFileAnchorReader >> initialize [
	super initialize.
	lineCount := 1
]

{ #category : #reading }
FamixFileAnchorReader >> manageNewLineReturnBeforeStartFromCr: aBoolean [
	self increment.
	lineCount = self startLine ifFalse: [ ^ self ].
	
	aBoolean
		ifTrue: [ "For CRLF" self skipNextIfLf ].
	self readUntilStartColumn
]

{ #category : #reading }
FamixFileAnchorReader >> read [
	[ [ self tryToRead ]
		on: ZnCharacterEncodingError
		do:
			[ "Sometime while reading characters one by one it fail, so we try to read the full file and the just the part we want."
			self reset.
			readStream := readStream contents readStream.
			self tryToRead ] ]
		on: Error
		do:
			[ "If the model is wrong, the file can be smaller than the model think. In that case we just stop the reading" ]
]

{ #category : #accessing }
FamixFileAnchorReader >> readStream: anObject [
	readStream := anObject
]

{ #category : #reading }
FamixFileAnchorReader >> readUntil: endLine [
	[ lineCount < endLine ]
		whileTrue: [ (char := readStream next) isCr
				ifTrue: [ self increment.
					writeStream nextPut: char.
					readStream peek
						ifNotNil: [ :char2 | 
							char2 isLf
								ifTrue: [ writeStream nextPut: readStream next ] ] ]
				ifFalse: [ char isLf
						ifTrue: [ self increment ].
					writeStream nextPut: char ] ].
	self readUntilEndColumn
]

{ #category : #reading }
FamixFileAnchorReader >> readUntilEndColumn [
	fileAnchor endColumn
		ifNil: [ readStream peek ifNotNil: [ [ (char := readStream next) isCr or: [ char isLf ] ] whileFalse: [ writeStream nextPut: char ] ] ]
		ifNotNil: [ :ec | 
			| numberOfCharToRead |
			numberOfCharToRead := self startLine = fileAnchor endLine
				ifTrue: [ ec - (fileAnchor startColumn ifNil: [ 1 ]) ]
				ifFalse: [ ec - 1 ].
			writeStream nextPutAll: (readStream next: numberOfCharToRead) ]
]

{ #category : #reading }
FamixFileAnchorReader >> readUntilStart [
	[ lineCount < self startLine ]
		whileTrue: [ (char := readStream next) isCr
				ifTrue: [ self manageNewLineReturnBeforeStartFromCr: true.
					readStream peek isLf
						ifTrue: [ readStream next ] ]
				ifFalse: [ char isLf
						ifTrue: [ self manageNewLineReturnBeforeStartFromCr: false ] ] ]
]

{ #category : #reading }
FamixFileAnchorReader >> readUntilStartColumn [
	readStream skip: (fileAnchor startColumn ifNil: [ 1 ]) - 1
]

{ #category : #reading }
FamixFileAnchorReader >> reset [
	self initialize.
	readStream reset.
	writeStream reset
]

{ #category : #reading }
FamixFileAnchorReader >> skipNextIfLf [
	"I will probably be called after a CR to remove a possible CRLF"

	readStream peek isLf ifTrue: [ readStream next ]
]

{ #category : #accessing }
FamixFileAnchorReader >> startLine [
	^ startLine ifNil: [ startLine := fileAnchor startLine ifNil: [ 1 ] ]
]

{ #category : #reading }
FamixFileAnchorReader >> tryToRead [
	self readUntilStart.
	fileAnchor endLine
		ifNil: [ writeStream nextPutAll: readStream upToEnd ]
		ifNotNil: [ :endLine | self readUntil: endLine ]
]

{ #category : #accessing }
FamixFileAnchorReader >> writeStream: anObject [
	writeStream := anObject
]
