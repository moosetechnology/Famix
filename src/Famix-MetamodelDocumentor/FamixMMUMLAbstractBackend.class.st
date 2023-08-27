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
	#category : #'Famix-MetamodelDocumentor'
}

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

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateClass: aName [
	outputStream
		nextPutAll: 'class ' ;
		nextPutAll: aName ;
		cr
]

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateFooter [

]

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateHeader [

]

{ #category : #'as yet unclassified' }
FamixMMUMLAbstractBackend >> generateInheritanceSuper: superclass sub: subclass [
	outputStream
		nextPutAll: superclass ;
		nextPutAll: ' <|-- ' ;
		nextPutAll: subclass ;
		cr
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
