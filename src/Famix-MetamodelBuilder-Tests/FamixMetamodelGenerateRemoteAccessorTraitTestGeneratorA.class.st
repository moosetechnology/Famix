Class {
	#name : #FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorA,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'fmx'
	],
	#category : #'Famix-MetamodelBuilder-Tests-GeneratorRessources'
}

{ #category : #testing }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorA class >> isRealMetamodel [
	^ false
]

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
