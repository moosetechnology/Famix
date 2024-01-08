"
A backend (exporter) for Mermaid ([https://mermaid.js.org/](https://mermaid.js.org/))

Note: Mermaid reuses many things from the PlantUML syntax (or is it the other way around?)
"
Class {
	#name : #FamixUMLMermaidBackend,
	#superclass : #FamixUMLPlantUMLBackend,
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #generating }
FamixUMLMermaidBackend >> generateClassFooter: aUMLClass [
	"changes to PlantUML method:
	 - no {} if there are no properties"

	aUMLClass properties ifNotEmpty: [
		outputStream << '}' ].

	outputStream cr.
]

{ #category : #generating }
FamixUMLMermaidBackend >> generateClassHeader: aUMLClass [
	"changes to PlantUML method:
	 - no <<...>> or color
	 - no {} if there are no properties"

	outputStream
		<< 'class ' ;
		<< aUMLClass name.

	aUMLClass properties ifNotEmpty: [
		outputStream << ' {' ].

	outputStream cr.

]

{ #category : #generating }
FamixUMLMermaidBackend >> generateFooter [

]

{ #category : #generating }
FamixUMLMermaidBackend >> generateHeader [
	outputStream
		<< 'classDiagram' ;
		cr
]
