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
	FamixMetamodelGenerateRemoteAccessorTestGeneratorA generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties generate
]

{ #category : 'running' }
FamixGenerateRemotePropertiesTestResource >> tearDown [
	[ 'Famix-MetamodelBuilder-TestsResources-A' asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
	[ FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties packageName asPackage removeFromSystem ]
		on: NotFound
		do: [  ].
]
