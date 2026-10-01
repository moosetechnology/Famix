Class {
	#name : 'FamixJavaFoldersImporterTest',
	#superclass : 'TestCase',
	#instVars : [
		'testFolder'
	],
	#category : 'Moose-Importers-Tests',
	#package : 'Moose-Importers-Tests'
}

{ #category : 'tests' }
FamixJavaFoldersImporterTest >> createTempFolder [

	| folder mainFile |
	folder := FileLocator temp / UUID new asString.
	folder ensureCreateDirectory.
	mainFile := folder / 'main.java'.
	mainFile := folder / 'main.java'.
	mainFile writeStreamDo: [ :stream |
			stream nextPutAll: 'public class Main {
	public static void main(String[] args) {
		System.out.println("Hello");
	}
}' ].
	^ folder
]

{ #category : 'running' }
FamixJavaFoldersImporterTest >> setUp [
	super setUp.

	testFolder := self createTempFolder. 
]

{ #category : 'running' }
FamixJavaFoldersImporterTest >> tearDown [

	testFolder ensureDeleteAll.
	super tearDown
]

{ #category : 'tests' }
FamixJavaFoldersImporterTest >> testModelRootFolder [

	| model |
	model := FamixJavaFoldersImporter importFolder: testFolder.

	self assert: model rootFolder fullName equals: testFolder fullName
]
