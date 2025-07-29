Class {
	#name : 'FamixRemoteRootEntityGeneratorC',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'fmx',
		'fmx2',
		'fmx3',
		'entityA',
		'entityB'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixRemoteRootEntityGeneratorC class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-Tests-RootEntityC'
]

{ #category : 'accessing' }
FamixRemoteRootEntityGeneratorC class >> prefix [

	<ignoreForCoverage>
	^ #FmxRootEntityC
]

{ #category : 'accessing' }
FamixRemoteRootEntityGeneratorC class >> submetamodels [

	^ {
		  FamixRemoteRootEntityGeneratorA.
		  FamixRemoteRootEntityGeneratorB }
]

{ #category : 'definition' }
FamixRemoteRootEntityGeneratorC >> defineClasses [
	super defineClasses.
	fmx := builder newClassNamed: #EntityC.
	fmx withTesting.
	fmx2 := builder newClassNamed: #EntityDSuper.
	fmx2 withTesting.
	fmx3 := builder newClassNamed: #EntityD.
	fmx3 withTesting.
	
	entityA := self remoteEntity: #Entity withPrefix: #FmxRootEntityA.
	entityB := self remoteEntity: #Entity withPrefix: #FmxRootEntityB.
]

{ #category : 'definition' }
FamixRemoteRootEntityGeneratorC >> defineHierarchy [

	super defineHierarchy.

	fmx --|> entityA.
	fmx2 --|> entityB.
	fmx3 --|> fmx2
]
