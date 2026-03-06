Class {
	#name : 'FamixRemoteRootEntityGeneratorB',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'fmx',
		'entity'
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
	entity := builder newClassNamed: #Entity.
	fmx := builder newClassNamed: #EntityB.
	fmx withTesting
]

{ #category : 'definition' }
FamixRemoteRootEntityGeneratorB >> defineHierarchy [

	super defineHierarchy.
	fmx --|> entity
]
