"
I output the model in a text form

I can outpout in a stream or in a file
"
Class {
	#name : #FamixUMLTextBackend,
	#superclass : #FamixUMLAbstractBackend,
	#instVars : [
		'outputStream'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #api }
FamixUMLTextBackend >> export: entities [
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
FamixUMLTextBackend >> generateAssociation: association [

	outputStream 
		<< association asString
]

{ #category : #generating }
FamixUMLTextBackend >> generateClass: aClass [

	self generateClassHeader: aClass.
	self generateClassProperties: aClass.
	self generateClassFooter: aClass.
]

{ #category : #generating }
FamixUMLTextBackend >> generateClassFooter: aUMLClass [

	outputStream
		cr.
]

{ #category : #generating }
FamixUMLTextBackend >> generateClassHeader: aClass [

	outputStream
		<< 'aUMLClass: ' ;
		<< aClass name
]

{ #category : #generating }
FamixUMLTextBackend >> generateClassProperties: aClass [

	aClass properties do: [ :prop | self generateProperty: prop ].
]

{ #category : #generating }
FamixUMLTextBackend >> generateClasses: entities [

	entities do: [ :each |
		(each class = FamixUMLClass)
		ifTrue: [ self generateClass: each ]
	]
]

{ #category : #generating }
FamixUMLTextBackend >> generateFooter [

]

{ #category : #generating }
FamixUMLTextBackend >> generateHeader [

]

{ #category : #generating }
FamixUMLTextBackend >> generateInheritance: inheritance [

	outputStream
		<< inheritance source ;
		<< ' subclass-of: ' ;
		<< inheritance target ;
		cr
]

{ #category : #generating }
FamixUMLTextBackend >> generateInheritances: entities [

	entities do: [ :each |
		(each class = FamixUMLInheritance)
		ifTrue: [ self generateInheritance: each ]
	]
]

{ #category : #generating }
FamixUMLTextBackend >> generateProperty: property [

	outputStream
		<< '  ' ;
		<< property type name ;
		<< ' : ' ;
		<< property name ;
		cr
]

{ #category : #generating }
FamixUMLTextBackend >> generateRelations: entities [

	entities do: [ :each |
		(each class = FamixUMLAssociation)
		ifTrue: [ self generateAssociation: each ]
	]
]

{ #category : #generating }
FamixUMLTextBackend >> generateUse: aUseLink [

	outputStream
		<< aUseLink source ;
		<< ' uses-trait: ' ;
		<< aUseLink target ;
		cr
]

{ #category : #generating }
FamixUMLTextBackend >> generateUses: entities [

	entities do: [ :each |
		(each class = FamixUMLUse)
		ifTrue: [ self generateUse: each ]
	]
]

{ #category : #initialization }
FamixUMLTextBackend >> initialize [

	super initialize.

	self outputStream: (WriteStream with: String new).
]

{ #category : #accessing }
FamixUMLTextBackend >> outputStream [

	^ outputStream
]

{ #category : #accessing }
FamixUMLTextBackend >> outputStream: anObject [

	outputStream := anObject
]

{ #category : #api }
FamixUMLTextBackend >> toFile: filename [

	outputStream := filename asFileReference writeStream
]
