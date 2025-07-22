Class {
	#name : 'FamixMetamodelGenerateRemoteAccessorTestGeneratorA',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'fmx'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorA class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources-A'
]

{ #category : 'accessing' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorA class >> prefix [

<ignoreForCoverage>
	^ #FmxTestGenerateAccessorA
]

{ #category : 'definition' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorA >> defineClasses [
	super defineClasses.
	fmx := builder newClassNamed: #EntityA
]
