Class {
	#name : #FamixUMLPlantUMLBackend,
	#superclass : #FamixUMLAbstractBackend,
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #generating }
FamixUMLPlantUMLBackend >> classMarker: aUMLClass [
	^aUMLClass isTrait
	ifTrue: [ $T ]
	ifFalse: [ $C ]
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateAssociation: association [

	outputStream
		nextPutAll: association source ;
		nextPutAll: ' -- ' ;
		nextPutAll: association target ;
		cr
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateClassFooter: aUMLClass [

	outputStream
		<< '}' ;
		cr.
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateClassHeader: aUMLClass [

	outputStream
		<< 'class ' ;
		<< aUMLClass name ;
		<< ' << (' ;
		<< (self classMarker: aUMLClass) ;
		<< $, ;
		<< aUMLClass color asHexString ;
		<< ') >> #' ;
		<< aUMLClass color asHexString ;
		<< ' {';
		cr.

]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateFooter [
	outputStream
		<< '@enduml' ;
		cr
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateHeader [
	outputStream
		<< '@startuml
hide empty members
skinparam class {
  BackgroundColor white
  ArrowColor black
  BorderColor darkGray
  BackgroundColor<<External>> LightYellow
  BorderColor<<External>> LightGray
}' ;
	cr
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateInheritance: inheritance [

	outputStream
		nextPutAll: inheritance target ;
		nextPutAll: ' <|-- ' ;
		nextPutAll: inheritance source ;
		cr
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateProperty: property [

	outputStream
		<< '  ' ;
		<< property type ;
		<< ' ' ;
		<< property name ;
		cr
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateUse: aUseLink [

	outputStream
		<< aUseLink target ;
		<< ' <|.. ' ;
		<< aUseLink source ;
		cr
]
