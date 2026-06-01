"
I am a Famix metamodel generator to test the UML Documentor on 2 metamodels.
"
Class {
	#name : 'FamixUMLDocumentorTest2Generator',
	#superclass : 'FamixMetamodelGenerator',
	#category : 'Famix-UMLDocumentor-Tests-FamixGenerator',
	#package : 'Famix-UMLDocumentor-Tests',
	#tag : 'FamixGenerator'
}

{ #category : 'accessing' }
FamixUMLDocumentorTest2Generator class >> packageName [

	^ #'Famix-UMLDocumentor-TestMetaModel2'
]

{ #category : 'accessing' }
FamixUMLDocumentorTest2Generator class >> prefix [

	^ #'FD2'
]

{ #category : 'definition' }
FamixUMLDocumentorTest2Generator >> defineClasses [

	super defineClasses.
	builder newClassNamed: #Class
]
