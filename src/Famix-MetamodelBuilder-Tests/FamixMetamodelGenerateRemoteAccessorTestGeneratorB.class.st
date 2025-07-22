Class {
	#name : 'FamixMetamodelGenerateRemoteAccessorTestGeneratorB',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'fmx'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorB class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources-B'
]

{ #category : 'accessing' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorB class >> prefix [

<ignoreForCoverage>
	^ #FmxTestGenerateAccessorB
]

{ #category : 'definition' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorB >> defineClasses [
	super defineClasses.
	fmx := builder newClassNamed: #EntityB
]
