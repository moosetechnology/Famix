"
I am a Famix meta model generator to test the use of traits.
"
Class {
	#name : #FamixMMUMLTest1Generator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		't1',
		't2',
		't3',
		't4'
	],
	#category : #'Famix-MetamodelDocumentor'
}

{ #category : #accessing }
FamixMMUMLTest1Generator class >> packageName [

	^ #'Famix-TestModel1MetamodelDocumentor'
]

{ #category : #accessing }
FamixMMUMLTest1Generator class >> prefix [

	^ #'FD'
]

{ #category : #definition }
FamixMMUMLTest1Generator >> defineHierarchy [

	super defineHierarchy.
	t2 --|> t1.
	t3 --|> t2.
	t4 --|> t2
]

{ #category : #definition }
FamixMMUMLTest1Generator >> defineTraits [

	super defineTraits.
	t1 := builder newTraitNamed: #Trait1.
	t2 := builder newTraitNamed: #Trait2.
	t3 := builder newTraitNamed: #Trait3.
	t4 := builder newTraitNamed: #Trait4
]

{ #category : #initialization }
FamixMMUMLTest1Generator >> initialize [
	super initialize.
	self notImportedFromFile
]
