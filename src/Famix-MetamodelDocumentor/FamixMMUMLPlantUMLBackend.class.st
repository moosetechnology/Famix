Class {
	#name : #FamixMMUMLPlantUMLBackend,
	#superclass : #FamixMMUMLAbstractBackend,
	#category : #'Famix-MetamodelDocumentor-Backend'
}

{ #category : #'as yet unclassified' }
FamixMMUMLPlantUMLBackend >> generateFooter [
	^'@enduml'
]

{ #category : #'as yet unclassified' }
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
