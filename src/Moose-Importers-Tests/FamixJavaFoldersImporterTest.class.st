Class {
	#name : 'FamixJavaFoldersImporterTest',
	#superclass : 'TestCase',
	#category : 'Moose-Importers-Tests',
	#package : 'Moose-Importers-Tests'
}

{ #category : 'tests' }
FamixJavaFoldersImporterTest >> createTempFolder [

	| folder |
	folder := FileLocator temp / UUID new asString.
	folder ensureCreateDirectory.
	^ folder
]

{ #category : 'tests' }
FamixJavaFoldersImporterTest >> testModelRootFolder [

	| folder model |
	folder := self createTempFolder.

	model := FamixJavaFoldersImporter importFolder: folder.

	self assert: model rootFolder fullName equals: folder fullName
]
