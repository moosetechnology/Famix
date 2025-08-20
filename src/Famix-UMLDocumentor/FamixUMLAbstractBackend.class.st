"
I offer methods to output a UML diagram according to a specif backend.

The backends are implemented as subclasses
"
Class {
	#name : #FamixUMLAbstractBackend,
	#superclass : #Object,
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #api }
FamixUMLAbstractBackend >> export: entities [

	self generateClasses: entities.
	self generateInheritances: entities.
	self generateUses: entities.
	self generateRelations: entities.

]

{ #category : #generating }
FamixUMLAbstractBackend >> generateAssociation: association [

	self subclassResponsibility 
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClass: aClass [

	self generateClassProperties: aClass.

]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClass: aClass property: property [

	self subclassResponsibility 
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClassProperties: aClass [

	aClass properties do: [ :prop | self generateClass: aClass property: prop].
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClasses: entities [

	entities do: [ :each |
		(each class = FamixUMLClass)
		ifTrue: [ self generateClass: each ]
	]
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateInheritance: inheritance [

	self subclassResponsibility 
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateInheritances: entities [

	entities do: [ :each |
		(each class = FamixUMLInheritance)
		ifTrue: [ self generateInheritance: each ]
	]
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateRelations: entities [

	entities do: [ :each |
		(each class = FamixUMLAssociation)
		ifTrue: [ self generateAssociation: each ]
	]
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateUse: aUseLink [

	self subclassResponsibility 
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateUses: entities [

	entities do: [ :each |
		(each class = FamixUMLUse)
		ifTrue: [ self generateUse: each ]
	]
]
