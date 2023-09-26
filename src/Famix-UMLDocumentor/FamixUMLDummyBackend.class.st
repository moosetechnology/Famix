"
I offer methods to output a UML diagram according to a specif backend.

The backends are implemented as subclasses
"
Class {
	#name : #FamixUMLDummyBackend,
	#superclass : #Object,
	#instVars : [
		'outputStream'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #api }
FamixUMLDummyBackend >> export: entities [
	"for readibility of results, entities are grouped according to their class"

	self generateHeader.

	self generateClasses: entities.
	self generateInheritances: entities.
	self generateUses: entities.
	self generateRelations: entities.

	self generateFooter.
	
	^[outputStream close ; contents]
	on: MessageNotUnderstood
	do: [ "for ZnCharacterWriteStream do3s not answer to #contents :-("
		''
	]
]

{ #category : #generating }
FamixUMLDummyBackend >> generateAssociation: association [

	outputStream 
		<< association asString
]

{ #category : #generating }
FamixUMLDummyBackend >> generateClass: aClass [

	self generateClassHeader: aClass.
	self generateClassProperties: aClass.
	self generateClassFooter: aClass.
]

{ #category : #generating }
FamixUMLDummyBackend >> generateClassFooter: aUMLClass [

	outputStream
		cr.
]

{ #category : #generating }
FamixUMLDummyBackend >> generateClassHeader: aClass [

	outputStream
		<< 'aUMLClass: ' ;
		<< aClass name
]

{ #category : #generating }
FamixUMLDummyBackend >> generateClassProperties: aClass [

	aClass properties do: [ :prop | self generateProperty: prop ].
]

{ #category : #generating }
FamixUMLDummyBackend >> generateClasses: entities [

	entities do: [ :each |
		(each class = FamixUMLClass)
		ifTrue: [ self generateClass: each ]
	]
]

{ #category : #generating }
FamixUMLDummyBackend >> generateFooter [

]

{ #category : #generating }
FamixUMLDummyBackend >> generateHeader [

]

{ #category : #generating }
FamixUMLDummyBackend >> generateInheritance: inheritance [

	outputStream
		<< inheritance source ;
		<< ' subclass-of: ' ;
		<< inheritance target ;
		cr
]

{ #category : #generating }
FamixUMLDummyBackend >> generateInheritances: entities [

	entities do: [ :each |
		(each class = FamixUMLInheritance)
		ifTrue: [ self generateInheritance: each ]
	]
]

{ #category : #generating }
FamixUMLDummyBackend >> generateProperty: property [

	outputStream
		<< '  ' ;
		<< property type name ;
		<< ' : ' ;
		<< property name ;
		cr
]

{ #category : #generating }
FamixUMLDummyBackend >> generateRelations: entities [

	entities do: [ :each |
		(each class = FamixUMLAssociation)
		ifTrue: [ self generateAssociation: each ]
	]
]

{ #category : #generating }
FamixUMLDummyBackend >> generateUse: aUseLink [

	outputStream
		<< aUseLink source ;
		<< ' uses-trait: ' ;
		<< aUseLink target ;
		cr
]

{ #category : #generating }
FamixUMLDummyBackend >> generateUses: entities [

	entities do: [ :each |
		(each class = FamixUMLUse)
		ifTrue: [ self generateUse: each ]
	]
]

{ #category : #initialization }
FamixUMLDummyBackend >> initialize [

	super initialize.

	self outputStream: (WriteStream with: String new).
]

{ #category : #accessing }
FamixUMLDummyBackend >> outputStream [

	^ outputStream
]

{ #category : #accessing }
FamixUMLDummyBackend >> outputStream: anObject [

	outputStream := anObject
]

{ #category : #api }
FamixUMLDummyBackend >> toFile: filename [

	outputStream := filename asFileReference writeStream
]
