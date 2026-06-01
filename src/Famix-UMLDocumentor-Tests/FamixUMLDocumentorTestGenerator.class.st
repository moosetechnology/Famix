"
I am a Famix metamodel generator to test the UML Docmumentor.
"
Class {
	#name : 'FamixUMLDocumentorTestGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		't1',
		't2',
		't3',
		't4',
		'c1',
		'c2'
	],
	#category : 'Famix-UMLDocumentor-Tests-FamixGenerator',
	#package : 'Famix-UMLDocumentor-Tests',
	#tag : 'FamixGenerator'
}

{ #category : 'accessing' }
FamixUMLDocumentorTestGenerator class >> packageName [

	^ #'Famix-UMLDocumentor-TestMetaModel'
]

{ #category : 'accessing' }
FamixUMLDocumentorTestGenerator class >> prefix [

	^ #'FD'
]

{ #category : 'definition' }
FamixUMLDocumentorTestGenerator >> defineClasses [

	super defineClasses.

	c1 := builder newClassNamed: #Class1.
	c2 := builder newClassNamed: #Class2.
]

{ #category : 'definition' }
FamixUMLDocumentorTestGenerator >> defineHierarchy [

	super defineHierarchy.

	c1 --|> t3.
	c2 --|> c1.

	t2 --|> t1.
	t3 --|> t2.
	t4 --|> t2.
]

{ #category : 'definition' }
FamixUMLDocumentorTestGenerator >> defineProperties [

	super defineProperties.

	(t4 property: #someProp type: #String)
		comment: 'A property in the trait'.

	(t4 property: #otherProp type: #Object)
		comment: 'Another property in the trait'.
]

{ #category : 'definition' }
FamixUMLDocumentorTestGenerator >> defineRelations [

	super defineRelations.

	(c1 property: #myTrait) *- t4
]

{ #category : 'definition' }
FamixUMLDocumentorTestGenerator >> defineTraits [

	super defineTraits.
	t1 := builder newTraitNamed: #Trait1.
	t2 := builder newTraitNamed: #Trait2.
	t3 := builder newTraitNamed: #Trait3.
	t4 := builder newTraitNamed: #Trait4
]
