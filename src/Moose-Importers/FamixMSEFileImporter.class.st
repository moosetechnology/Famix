"
Importer for MSE files
"
Class {
	#name : #FamixMSEFileImporter,
	#superclass : #FamixAbstractFileImporter,
	#category : #'Moose-Importers'
}

{ #category : #executing }
FamixMSEFileImporter class >> fileExtension [
	^'mse'
]

{ #category : #running }
FamixMSEFileImporter >> run [
	[ model importFromMSEStream: inputStream ]
	ensure: [ inputStream close ]
]

{ #category : #'as yet unclassified' }
FamixMSEFileImporter >> runFilteredBy: anImportingContext [

	[ model importFromMSEStream: inputStream filteredBy: anImportingContext ] 
		ensure: [ inputStream close ]
]
