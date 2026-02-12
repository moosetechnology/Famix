Class {
	#name : 'FamixBytesFileAnchorTest',
	#superclass : 'FamixAbstractFileAnchorTest',
	#category : 'Famix-Test1-Tests-SourceAnchor',
	#package : 'Famix-Test1-Tests',
	#tag : 'SourceAnchor'
}

{ #category : 'helpers' }
FamixBytesFileAnchorTest >> actualClass [
	^ FamixTest1BytesFileAnchor
]

{ #category : 'helpers' }
FamixBytesFileAnchorTest >> adaptAnchorForCrlf: anchor [

	anchor
		startByte: 54;
		endByte: 281
]

{ #category : 'helpers' }
FamixBytesFileAnchorTest >> anchorForClassTest [
	| file anchor |
	file := (FileSystem memory / 'test.java')
		ensureCreateFile;
		writeStreamDo: [ :s | s nextPutAll: self sourceCodeForTest ];
		yourself.
	anchor := self actualClass new
		startByte: 50;
		endByte: 261;
		fileName: 'test.java';
		yourself.
	anchor stub rootFolder willReturn: file parent.
	^ anchor
]

{ #category : 'helpers' }
FamixBytesFileAnchorTest >> sourceCodeForTest [
	"I'm adding emojies to have characters with multiple bytes."

	^ 'package goosegame.dice;

import goosegame.Dice;

/**
 * Dice9 return 9 all the time.😀😃
 */
public class Dice9 implements Dice {


	public Dice9() {
	}

	/* (non-Javadoc)
	 * @see goosegame.Dice#throwDice()
	 */
	public int throwDice() {
		return 9;
	}

}'
]

{ #category : 'tests' }
FamixBytesFileAnchorTest >> testEndPos [

	| anchor |
	anchor := self anchorForClassTest.
	self assert: anchor endPos equals: 254
]

{ #category : 'tests' }
FamixBytesFileAnchorTest >> testSourceText [

	| anchor |
	anchor := self anchorForClassTest
		          startByte: 219;
		          endByte: 257;
		          yourself.
	anchor stub completeText willReturn: self sourceCodeForTest.
	self assert: anchor sourceText equals: 'public int throwDice() {
		return 9;
	}'
]

{ #category : 'tests' }
FamixBytesFileAnchorTest >> testStartPos [

	| anchor |
	anchor := self anchorForClassTest.
	self assert: anchor startPos equals: 50
]
