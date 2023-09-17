"
I offer methods to output a UML diagram according to a specif backend.

The backends are implemented as subclasses
"
Class {
	#name : #FamixUMLAbstractBackend,
	#superclass : #Object,
	#instVars : [
		'outputStream'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #api }
FamixUMLAbstractBackend >> export: entities [
	"for readibility of results, entities are grouped according to their class"

	self generateHeader.

	self generateClasses: entities.
	self generateInheritances: entities.
	self generateRelations: entities.
	self generateExternalClasses: entities.

	self generateFooter.
	
	^outputStream contents

]

{ #category : #generating }
FamixUMLAbstractBackend >> generateAssociation: association [

	outputStream 
		<< association asString
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateAssociationBetween: class1 and: class2 [
	outputStream
		nextPutAll: class1 ;
		nextPutAll: ' -- ' ;
		nextPutAll: class2 ;
		cr
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClass: aClass [

	self generateClassHeader: aClass.
	self generateClassProperties: aClass.
	self generateClassFooter: aClass.
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClassFooter: aUMLClass [

	outputStream
		cr.
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClassHeader: aClass [

	outputStream
		<< 'aUMLClass: ' ;
		<< aClass name
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClassProperties: aClass [

	aClass properties do: [ :prop | self generateProperty: prop ].
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateClasses: entities [

	entities do: [ :each |
		(each class = FamixUMLClass)
		ifTrue: [ self generateClass: each ]
	]
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateExternalClass: entity [

]

{ #category : #generating }
FamixUMLAbstractBackend >> generateExternalClasses: entities [

	entities do: [ :each |
		(each class = FamixUMLAssociation)
		ifTrue: [ self generateExternalClass: each ]
	]
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateFooter [

]

{ #category : #generating }
FamixUMLAbstractBackend >> generateHeader [

]

{ #category : #generating }
FamixUMLAbstractBackend >> generateInheritance: inheritance [

	outputStream
		<< inheritance source ;
		<< ' subclass-of: ' ;
		<< inheritance target ;
		cr
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateInheritances: entities [

	entities do: [ :each |
		(each class = FamixUMLInheritance)
		ifTrue: [ self generateInheritance: each ]
	]
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateProperty: property [

	outputStream
		<< '  ' ;
		<< property type name ;
		<< ' : ' ;
		<< property name ;
		cr
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateRelations: entities [

	entities do: [ :each |
		(each class = FamixUMLAssociation)
		ifTrue: [ self generateAssociation: each ]
	]
]

{ #category : #generating }
FamixUMLAbstractBackend >> generateUseTrait: aTrait class: aclass [
	outputStream
		nextPutAll: aTrait ;
		nextPutAll: ' <|.. ' ;
		nextPutAll: aclass ;
		cr
]

{ #category : #initialization }
FamixUMLAbstractBackend >> initialize [

	super initialize.

	self outputStream: (WriteStream with: String new).
]

{ #category : #accessing }
FamixUMLAbstractBackend >> outputStream [

	^ outputStream
]

{ #category : #accessing }
FamixUMLAbstractBackend >> outputStream: anObject [

	outputStream := anObject
]
