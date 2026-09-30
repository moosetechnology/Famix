"
A backend (exporter) for Mermaid ([https://mermaid.js.org/](https://mermaid.js.org/))

Note: Mermaid reuses many things from the PlantUML syntax (or is it the other way around?)
"
Class {
	#name : #FamixUMLMermaidBackend,
	#superclass : #FamixUMLPlantUMLBackend,
	#instVars : [
		'allColors'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #generating }
FamixUMLMermaidBackend >> generateClassFooter: aUMLClass [

	"changes to PlantUML method:
	 - no {} if there are no properties"

	aUMLClass properties ifNotEmpty: [
		super generateClassFooter: aUMLClass
	].

]

{ #category : #generating }
FamixUMLMermaidBackend >> generateClassHeader: aUMLClass [
	"changes to PlantUML method:
	 - no output if there are no properties
	 - no color (managed through 'Themes' at the end)"

	aUMLClass properties ifNotEmpty: [
		outputStream
			<< 'class ' ;
			<< aUMLClass name ;
			<< ' {' ;
			cr
	]

]

{ #category : #generating }
FamixUMLMermaidBackend >> generateClasses: entities [
	"changes to PlantUML method:
	 create class themes for the colors"

	self initiateClassThemes: (entities select: [:each | each class = FamixUMLClass]).

	super generateClasses: entities.

	outputStream lf

]

{ #category : #generating }
FamixUMLMermaidBackend >> generateFooter [
	"create the themes for class colors"

	self generateThemeForClasses.
	self generateThemeDeclarations

]

{ #category : #generating }
FamixUMLMermaidBackend >> generateHeader [
	outputStream
		<< '---
config:
  theme: neutral
  class:
    hideEmptyMembersBox: true
---
classDiagram
'
]

{ #category : #generating }
FamixUMLMermaidBackend >> generateThemeDeclarations [

	outputStream lf.
	allColors keysDo: [ :color |
		outputStream
			<< 'classDef Theme_' ;
			<< color ;
			<< ' fill:#' ;
			<< color ;
			cr
	]

]

{ #category : #generating }
FamixUMLMermaidBackend >> generateThemeForClasses [

	outputStream lf.
	allColors keysAndValuesDo: [ :color :classes |
		classes do: [ :aClass |
			outputStream
				<< 'class ' ;
				<< aClass name ;
				<< ':::' ;
				<< 'Theme_' ;
				<< color ;
				cr
		]
	]
]

{ #category : #generating }
FamixUMLMermaidBackend >> initiateClassThemes: classes [
	"3 different colors in a diagram seems like a reasonnable default number"

	allColors := SmallDictionary new: 3.

	classes do: [ :each |
		allColors
			at: (each color asHexString)
			ifPresent: [ :colorClasses | colorClasses add: each ]
			ifAbsentPut: [ OrderedCollection with: each ]
	].

]
