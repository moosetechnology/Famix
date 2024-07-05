"
I am a Famix meta model generator to test the use of traits.
"
Class {
	#name : #FamixUMLTestGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		't1',
		't2',
		't3',
		't4',
		'c1',
		'c2'
	],
	#category : #'Famix-UMLDocumentor-Tests-FamixGenerator'
}

{ #category : #accessing }
FamixUMLTestGenerator class >> packageName [

	^ #'FamixDocumentor-TestMetaModel'
]

{ #category : #accessing }
FamixUMLTestGenerator class >> prefix [

	^ #'FD'
]

{ #category : #definition }
FamixUMLTestGenerator >> defineClasses [

	super defineClasses.

	c1 := builder newClassNamed: #Class1.
	c2 := builder newClassNamed: #Class2.
]

{ #category : #definition }
FamixUMLTestGenerator >> defineHierarchy [

	super defineHierarchy.

	c1 --|> t3.
	c2 --|> c1.

	t2 --|> t1.
	t3 --|> t2.
	t4 --|> t2.
]

{ #category : #definition }
FamixUMLTestGenerator >> defineProperties [

	super defineProperties.

	(t4 property: #someProp type: #String)
		comment: 'A property in the trait'.

	(t4 property: #otherProp type: #Object)
		comment: 'Another property in the trait'.
]

{ #category : #definition }
FamixUMLTestGenerator >> defineRelations [

	super defineRelations.

	(c1 property: #myTrait) *- t4
]

{ #category : #definition }
FamixUMLTestGenerator >> defineTraits [

	super defineTraits.
	t1 := builder newTraitNamed: #Trait1.
	t2 := builder newTraitNamed: #Trait2.
	t3 := builder newTraitNamed: #Trait3.
	t4 := builder newTraitNamed: #Trait4
]
