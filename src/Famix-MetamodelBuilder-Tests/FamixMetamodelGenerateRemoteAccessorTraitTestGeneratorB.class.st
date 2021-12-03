Class {
	#name : #FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'traitB',
		'traitA',
		'classA',
		'classB'
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
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB >> defineClasses [
	super defineClasses.
	
	classA := builder newClassNamed: #ClassA.
	classB := builder newClassNamed: #ClassB.
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB >> defineHierarchy [
	super defineHierarchy.
	
	classA --|> traitA.
	classB --|> traitB.
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB >> defineRelations [
	super defineRelations.

	(traitA property: #relationToB) - (traitB property: #relationToA).
]

{ #category : #definition }
FamixMetamodelGenerateRemoteAccessorTraitTestGeneratorB >> defineTraits [
	super defineTraits.
	traitB := builder newTraitNamed: #TraitB.
	traitA := self remoteTrait: #TraitA withPrefix: #FmxTraitsTestGenerateAccessorA.
]
