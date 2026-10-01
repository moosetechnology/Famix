Class {
	#name : #FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorA,
	#superclass : #FamixTestGenerator,
	#instVars : [
		'fmx'
	],
	#category : #'Famix-MetamodelBuilder-Tests-GeneratorRessources'
}

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorA class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsTraitsResources-A'
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorA class >> prefix [

<ignoreForCoverage>
	^ #FmxTraitsTestGenerateAccessorA
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorA >> defineTraits [
	super defineTraits.
	fmx := builder newTraitNamed: #TraitA
]
