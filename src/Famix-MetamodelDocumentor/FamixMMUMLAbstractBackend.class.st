"
I offer methods to output a UML diagram according to a specif backend.

The backends are implemented as subclasses
"
Class {
	#name : #FamixMMUMLAbstractBackend,
	#superclass : #Object,
	#instVars : [
		'outputStream'
	],
	#category : #'Famix-MetamodelDocumentor-Backend'
}

{ #category : #api }
FamixMMUMLAbstractBackend >> generate: entities on: aStream [
	"for readibility of results, entities are grouped according to their class"

	outputStream := aStream.

	self generateHeader.

	self generateClasses: entities.
	self generateInheritance: entities.
	self generateRelations: entities.
	self generateExternalClasses: entities.

	self generateFooter.

]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateAssociation: association [

	outputStream 
		<< association asString
]

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateAssociationBetween: class1 and: class2 [
	outputStream
		nextPutAll: class1 ;
		nextPutAll: ' -- ' ;
		nextPutAll: class2 ;
		cr
]

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateAssociationFrom: class1 to: class2 [
	outputStream
		nextPutAll: class1 ;
		nextPutAll: ' -- ' ;
		nextPutAll: class2 ;
		cr
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateClass: aClass [

	self generateClassHeader: aClass.
	self generateClassProperties: aClass.
	self generateClassFooter: aClass.
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateClassFooter: aUMLClass [

	outputStream
		cr.
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateClassHeader: aClass [

	outputStream
		<< 'aUMLClass: ' ;
		<< aClass name
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateClassProperties: aClass [

	aClass primitiveProperties do: [ :prop | self generateProperty: prop ].
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateClasses: entities [

	entities do: [ :each |
		(each class = FamixMMUMLClass)
		ifTrue: [ self generateClass: each ]
	]
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateExternalClass: entity [

]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateExternalClasses: entities [

	entities do: [ :each |
		(each class = FamixMMUMLAssociation)
		ifTrue: [ self generateExternalClass: each ]
	]
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateFooter [

]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateHeader [

]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateInheritance: inheritance [

	outputStream
		<< inheritance source ;
		<< ' subclass-of: ' ;
		<< inheritance target ;
		cr
]

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateInheritanceSuper: superclass sub: subclass [
	outputStream
		nextPutAll: superclass ;
		nextPutAll: ' <|-- ' ;
		nextPutAll: subclass ;
		cr
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateProperty: property [

	outputStream
		<< '  ' ;
		<< property type name ;
		<< ' : ' ;
		<< property name ;
		cr
]

{ #category : #generating }
FamixMMUMLAbstractBackend >> generateRelations: entities [

	entities do: [ :each |
		(each class = FamixMMUMLAssociation)
		ifTrue: [ self generateAssociation: each ]
	]
]

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateUseTrait: aTrait class: aclass [
	outputStream
		nextPutAll: aTrait ;
		nextPutAll: ' <|.. ' ;
		nextPutAll: aclass ;
		cr
]

{ #category : #accessing }
FamixMMUMLAbstractBackend >> outputStream [

	^ outputStream
]

{ #category : #accessing }
FamixMMUMLAbstractBackend >> outputStream: anObject [

	outputStream := anObject
]
