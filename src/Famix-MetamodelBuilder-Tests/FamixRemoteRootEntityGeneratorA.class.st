Class {
	#name : 'FamixRemoteRootEntityGeneratorA',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'fmx'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixRemoteRootEntityGeneratorA class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-Tests-RootEntityA'
]

{ #category : 'accessing' }
FamixRemoteRootEntityGeneratorA class >> prefix [

	<ignoreForCoverage>
	^ #FmxRootEntityA
]

{ #category : 'definition' }
FamixRemoteRootEntityGeneratorA >> defineClasses [

	super defineClasses.
	fmx := builder newClassNamed: #EntityA.
	fmx withTesting
]
