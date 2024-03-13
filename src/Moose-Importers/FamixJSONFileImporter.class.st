"
Importer for JSON file

"
Class {
	#name : #FamixJSONFileImporter,
	#superclass : #FamixAbstractFileImporter,
	#category : #'Moose-Importers'
}

{ #category : #executing }
FamixJSONFileImporter class >> fileExtension [
	^'json'
]

{ #category : #running }
FamixJSONFileImporter >> run [
	[ model importFromJSONStream: inputStream ]
	ensure: [ inputStream close ]
]

{ #category : #running }
FamixJSONFileImporter >> runFilteredBy: anImportingContext [

	[ model
		importFromJSONStream: inputStream
		filteredBy: anImportingContext ] ensure: [ inputStream close ]
]
