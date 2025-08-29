Class {
	#name : 'FamixGenerateRemotePropertiesTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'entityA'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Helpers',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Helpers'
}

{ #category : 'running' }
FamixGenerateRemotePropertiesTestResource >> classNamed: aSymbol [
	^ self class environment at: aSymbol ifAbsent: [ self fail ]
]

{ #category : 'running' }
FamixGenerateRemotePropertiesTestResource >> entityA [
	^ entityA
]

{ #category : 'running' }
FamixGenerateRemotePropertiesTestResource >> setUp [

	super setUp.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorA generate.
	FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties generate.

	"The following entities are created by the generators
	Do not remove them (or change the all the tests)"
	entityA := (self classNamed: #FmxTestGenerateAccessorAEntityA) new.
	(self classNamed: #FmxTestGenerateAccessorAModel) new addAll: {
			entityA. }
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
