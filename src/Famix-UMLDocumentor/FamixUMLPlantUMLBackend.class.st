Class {
	#name : #FamixUMLPlantUMLBackend,
	#superclass : #FamixUMLDummyBackend,
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

	outputStream << association source.

	"in UML source role is on target side and vice-versa"
	self generateTargetRole: association.
	self generateAssociationSymbol: association.
	self generateSourceRole: association.

	outputStream
		<< association target ;
		cr
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateAssociationSymbol: association [

	(association aggregation = #source)
		ifTrue: [ outputStream << ' o-- '. ^self ].
		
	(association aggregation = #target)
		ifTrue: [ outputStream << ' --o '. ^self ].

	outputStream << ' -- '
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
		<< ' <<(' ;
		<< (self classMarker: aUMLClass) ;
		<< ',#' ;
		<< aUMLClass color asHexString ;
		<< $).
	aUMLClass isStub ifTrue: [ outputStream << 'External' ].
	outputStream
		<< '>> #' ;
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
FamixUMLPlantUMLBackend >> generateSourceRole: association [

	(association sourceRole isNil and: [ association sourceCardinality = #one ])
		ifTrue: [ ^self ].

	outputStream << ' "'.

	association sourceRole ifNotNil: [ outputStream << association sourceRole ].
	(association sourceCardinality = #multi) ifTrue: [ outputStream << '* ' ].
	outputStream << $"

]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateTargetRole: association [

	(association targetRole isNil and: [ association targetCardinality = #one ])
		ifTrue: [ ^self ].

	outputStream << $".
	association targetRole ifNotNil: [ outputStream << association targetRole ].
	(association targetCardinality = #multi) ifTrue: [ outputStream << '*' ].

	outputStream << '" '
]

{ #category : #generating }
FamixUMLPlantUMLBackend >> generateUse: aUseLink [

	outputStream
		<< aUseLink target ;
		<< ' <|.. ' ;
		<< aUseLink source ;
		cr
]
