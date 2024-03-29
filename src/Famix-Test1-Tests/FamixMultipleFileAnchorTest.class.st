Class {
	#name : #FamixMultipleFileAnchorTest,
	#superclass : #FamixSourceAnchorTest,
	#instVars : [
		'multipleFileAnchor'
	],
	#category : #'Famix-Test1-Tests-SourceAnchor'
}

{ #category : #helpers }
FamixMultipleFileAnchorTest >> actualClass [
	^ FamixTest1MultipleFileAnchor
]

{ #category : #running }
FamixMultipleFileAnchorTest >> setUp [
	super setUp.
	multipleFileAnchor := self actualClass model: FamixTest1Model new.
	multipleFileAnchor addFileAnchorWithPath: 'aFileName1'.
	multipleFileAnchor addFileAnchorWithPath: 'aFileName2'.
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testAdditionOfFiles [
	self assert: multipleFileAnchor fileAnchors size equals: 2.
	self assert: multipleFileAnchor sourceText lines size equals: 4.

	multipleFileAnchor addFileAnchorWithPath: 'newFileName1'.
	self assert: multipleFileAnchor fileAnchors size equals: 3.
	self assert: multipleFileAnchor sourceText lines size equals: 6.
	
	multipleFileAnchor addFileAnchorWithPath: 'newFileName2'.
	self assert: multipleFileAnchor fileAnchors size equals: 4.
	self assert: multipleFileAnchor sourceText lines size equals: 8
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testAllSourceAnchors [
	self assert: multipleFileAnchor allSourceAnchors size equals: 2.
	multipleFileAnchor allSourceAnchors do: [ :each | self assert: each isFileAnchor ]
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testAllSourceAnchorsDo [
	| res |
	res := OrderedCollection new.
	multipleFileAnchor allSourceAnchorsDo: [ :each | res add: each ].

	self assert: res size equals: 2.
	res do: [ :each | self assert: each isFileAnchor ]
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testContainerFiles [
	| anchor |
	anchor := self actualClass new
		addSourceAnchor:
			(FamixTest1FileAnchor new
				correspondingFile:
					(FamixTest1File new
						name: 'test';
						yourself);
				yourself);
		addSourceAnchor:
			(FamixTest1FileAnchor new
				correspondingFile:
					(FamixTest1File new
						name: 'test2';
						yourself);
				yourself);
		yourself.
	self assert: anchor containerFiles size equals: 2.
	(anchor containerFiles collect: #name) do: [ :fileName | self assert: (#('test' 'test2') includes: fileName) ]
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testContainerFilesWithoutFileReferenced [
	"This test was added because before if a multiple source anchor does not have the corresponding files we got array of nils"

	| anchor |
	anchor := self actualClass new
		addSourceAnchor: FamixTest1FileAnchor new;
		addSourceAnchor: FamixTest1FileAnchor new;
		yourself.
	self assertEmpty: anchor containerFiles
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testIsMultiple [
	^ self assert: self actualClass new isMultiple
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testMultipleSourceAnchorEntity [
	| class |
	class := FamixTest1Class new
		mooseModel: FamixTest1Model new;
		defineMultiSourceAnchorWithPath: 'aClassName'.
	self assert: class sourceAnchor fileAnchors size equals: 1
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testSimilarFileAnchors [
	"Try to add again the same source anchors."

	1 to: 2 do: [ :each | multipleFileAnchor addFileAnchorWithPath: 'aFileName' , each asString ].
	self assert: multipleFileAnchor fileAnchors size equals: 2
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testSourceText [

	self assert: (multipleFileAnchor sourceText includesSubstring: ' ~~~ aFileName1 ~~~ ')
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testWritingAndReadingInMSE [
	| tempFile importedModel |
	tempFile := (FileSystem memory / 'files-test.mse')
		ensureCreateFile;
		yourself.
	tempFile writeStreamDo: [ :s | multipleFileAnchor mooseModel exportToMSEStream: s ].
	tempFile readStreamDo: [ :s | importedModel := FamixTest1Model importFromMSEStream: s ].
	self assert: (importedModel allUsing: FamixTMultipleFileAnchor) size equals: 1.
	self assert: (importedModel allUsing: FamixTFileAnchor) size equals: 2
]
