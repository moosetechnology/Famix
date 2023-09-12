Class {
	#name : #FamixMMUMLPlantUMLBackend,
	#superclass : #FamixMMUMLAbstractBackend,
	#category : #'Famix-MetamodelDocumentor-Backend'
}

{ #category : #generating }
FamixMMUMLPlantUMLBackend >> generateClass: aUMLClass [

	outputStream
		nextPutAll: 'class ' ;
		nextPutAll: aUMLClass name ;
		nextPutAll: ' << (' ;
		nextPutAll: (self plantUMLMarkerFor: aUMLClass) ;
		nextPut: $, ;
		nextPutAll: (self plantUMLColorFor: aUMLClass) ;
		nextPutAll: ') >>' ;
		nextPutAll: ' #';
		nextPutAll: (self plantUMLBackgroundColorFor: aUMLClass) ;
		nextPutAll: ' {';
		cr.
	aUMLClass
		primitiveProperties do: [ :prop | prop accept: self ].
	outputStream
		nextPutAll: '}' ;
		cr.
]

{ #category : #generating }
FamixMMUMLPlantUMLBackend >> generateClassFooter: aUMLClass [

	outputStream
		<< '}' ;
		cr.
]

{ #category : #generating }
FamixMMUMLPlantUMLBackend >> generateClassHeader: aUMLClass [

	outputStream
		<< 'class ' ;
		<< aUMLClass name ;
		<< ' << (' ;
		<< aUMLClass marker ;
		<< $, ;
		<< aUMLClass color ;
		<< ') >> #' ;
		<< aUMLClass backgroundColor ;
		<< ' {';
		cr.

]

{ #category : #generating }
FamixMMUMLPlantUMLBackend >> generateFooter [
	^'@enduml'
]

{ #category : #generating }
FamixMMUMLPlantUMLBackend >> generateHeader [
	^'@startuml
hide empty members
skinparam class {
  BackgroundColor white
  ArrowColor black
  BorderColor darkGray
  BackgroundColor<<External>> LightYellow
  BorderColor<<External>> LightGray
}'
]

{ #category : #generating }
FamixMMUMLPlantUMLBackend >> generateProperty: property [

	outputStream
		<< '  ' ;
		<< property type name ;
		<< ' ' ;
		<< property name ;
		cr
]
