Class {
	#name : #FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'traitB',
		'traitA'
	],
	#category : #'Famix-MetamodelBuilder-Tests-GeneratorRessources'
}

{ #category : #testing }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB class >> isRealMetamodel [
	^ false
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsTraitsResources-B'
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB class >> prefix [

<ignoreForCoverage>
	^ #FmxTraitsTestGenerateAccessorB
]

{ #category : #accessing }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB class >> submetamodels [
	^ { FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorA }
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB >> defineRelations [
	super defineRelations.
	(traitA property: #relationToB) - (traitB property: #relationToB).
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB >> defineTraits [
	super defineTraits.
	traitB := builder newTraitNamed: #TraitB.
	traitA := self remoteTrait: #TraitA withPrefix: #FmxTraitsTestGenerateAccessorA.
]
