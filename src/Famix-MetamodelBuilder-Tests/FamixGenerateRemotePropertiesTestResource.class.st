Class {
	#name : 'FamixGenerateRemotePropertiesTestResource',
	#superclass : 'TestResource',
	#category : 'Famix-MetamodelBuilder-Tests-Helpers',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Helpers'
}

{ #category : 'running' }
FamixGenerateRemotePropertiesTestResource >> classNamed: aSymbol [
	^ self class environment at: aSymbol ifAbsent: [ self fail ]
]

{ #category : 'running' }
FamixGenerateRemotePropertiesTestResource >> setUp [

	super setUp.
	FamixMetamodelGenerateRemotePropertiesTestGeneratorX generate.
	FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties generate
]

{ #category : 'running' }
FamixGenerateRemotePropertiesTestResource >> tearDown [
	[ 'Famix-MetamodelBuilder-TestsResources-X' asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	[ FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties packageName asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
]
