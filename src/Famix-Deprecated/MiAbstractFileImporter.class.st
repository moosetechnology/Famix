Class {
	#name : #MiAbstractFileImporter,
	#superclass : #FamixAbstractFileImporter,
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
MiAbstractFileImporter class >> acceptFile: aFileReference [

	^ super acceptFile: aFileReference
]

{ #category : #'model detection' }
MiAbstractFileImporter class >> canImport: inputSample importer: importer metaModel: tmpModel [

	^ super canImport: inputSample importer: importer metaModel: tmpModel
]

{ #category : #'model detection' }
MiAbstractFileImporter class >> findPossibleModelClassIn: aCollectionOfModels forFile: aFile [

	^ super findPossibleModelClassIn: aCollectionOfModels forFile: aFile
]

{ #category : #executing }
MiAbstractFileImporter class >> importerFor: aFileReference [

	^ super importerFor: aFileReference
]

{ #category : #testing }
MiAbstractFileImporter class >> isDeprecated [

	^ true
]

{ #category : #executing }
MiAbstractFileImporter class >> knownExtensions [

	^ super knownExtensions
]
