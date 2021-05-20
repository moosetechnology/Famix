"
I represent a FamixMetamodelGenerator name FmxMBTest1Generator.

I serve as a FamixMetamodelGenerator exclusively for test.
 
Internal Representation :

    Instance Variables
	tA:		<Trait>
	tB:		<Trait>
	tC:		<Trait>

	tA <|-- tB;
		<|-- tC.
		
	tA *-* tB.
"
Class {
	#name : #FmxMBTestOnlyTraits1Generator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'tA',
		'tB',
		'tC'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #accessing }
FmxMBTestOnlyTraits1Generator class >> packageName [

	^ #'MockGenerator'
]

{ #category : #accessing }
FmxMBTestOnlyTraits1Generator class >> prefix [
	^ #FmxMBTestOnlyTraits1Generator
]

{ #category : #definition }
FmxMBTestOnlyTraits1Generator >> defineHierarchy [
	super defineHierarchy.
	tA <|-- tB;
		<|-- tC.
]

{ #category : #definition }
FmxMBTestOnlyTraits1Generator >> defineRelations [
	super defineRelations.
	tA *-* tB.
]

{ #category : #definition }
FmxMBTestOnlyTraits1Generator >> defineTraits [
	super defineTraits.
	tA := builder newTraitNamed: #TA.
	tB := builder newTraitNamed: #TB.
	tC := builder newTraitNamed: #TC.
]
