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
FamixUMLAbstractBackend >> export: aColletionOfFamixUMLEntities [

	self subclassResponsibility 
]
