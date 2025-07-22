Class {
	#name : 'FamixRemoteRootEntityGeneratorB',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'fmx'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixRemoteRootEntityGeneratorB class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-Tests-RootEntityB'
]

{ #category : 'accessing' }
FamixRemoteRootEntityGeneratorB class >> prefix [

	<ignoreForCoverage>
	^ #FmxRootEntityB
]

{ #category : 'definition' }
FamixRemoteRootEntityGeneratorB >> defineClasses [

	super defineClasses.
	fmx := builder newClassNamed: #EntityB.
	fmx withTesting
]
