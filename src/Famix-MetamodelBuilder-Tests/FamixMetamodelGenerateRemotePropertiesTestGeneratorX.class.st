Class {
	#name : 'FamixMetamodelGenerateRemotePropertiesTestGeneratorX',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'fmx'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorX class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources-X'
]

{ #category : 'accessing' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorX class >> prefix [

<ignoreForCoverage>
	^ #FmxTestGeneratePropertiesX
]

{ #category : 'definition' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorX >> defineClasses [
	super defineClasses.
	fmx := builder newClassNamed: #EntityX
]
