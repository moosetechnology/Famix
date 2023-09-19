Class {
	#name : #FamixUMLPlantUMLBackendTest,
	#superclass : #TestCase,
	#instVars : [
		'backend'
	],
	#category : #'Famix-UMLDocumentor-Tests-Generation'
}

{ #category : #running }
FamixUMLPlantUMLBackendTest >> classNamed: aString [

	^FamixUMLClass new
		name: aString ;
		color: Color white ;
		yourself
]

{ #category : #running }
FamixUMLPlantUMLBackendTest >> link: aLink from: className to: superClassName [

	^aLink new
		source: className ;
		target: superClassName ;
		yourself
]

{ #category : #running }
FamixUMLPlantUMLBackendTest >> property: aName type: aString [

	^FamixUMLProperty new
		name: aName ;
		type: aString ;
		yourself
]

{ #category : #running }
FamixUMLPlantUMLBackendTest >> setUp [
	super setUp.

	backend := FamixUMLPlantUMLBackend new
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateAggregation [

	| umlLink |
	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.
	umlLink aggregation: #source.

	backend generateAssociation: umlLink.

	self assert: backend outputStream contents equals:
'ClassA o-- ClassB
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateAssociationCardinality [

	| umlLink |
	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.
	umlLink sourceCardinality: #multi.
	umlLink targetCardinality: #multi.

	backend generateAssociation: umlLink.

	self assert: backend outputStream contents equals:
'ClassA "*" -- "*" ClassB
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateAssociationRole [
	"note: association role is not supposed to be empty.
	this test is not realistic in this sense"

	| umlLink |
	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.
	umlLink sourceRole: 'roll'.
	umlLink targetRole: 'lol'.

	backend generateAssociation: umlLink.

	self assert: backend outputStream contents equals:
'ClassA "roll" -- "lol" ClassB
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateAssociationSimple [
	"note: association role is not supposed to be empty.
	this test is not realistic in this sense"

	| umlLink |
	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.

	backend generateAssociation: umlLink.

	self assert: backend outputStream contents equals:
'ClassA -- ClassB
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateClass [
	| umlClass |
	umlClass := self classNamed: 'AClass'.

	backend generateClass: umlClass.

	self assert: backend outputStream contents equals:
'class AClass <<(C,#FFFFFF)>> #FFFFFF {
}
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateClassProperties [
	| umlClass |
	umlClass := (self classNamed: 'AClass').
	umlClass 	properties: {
			self property: 'prop1' type: 'integer' .
			self property: 'prop2' type: 'whatever' .
		}.

	backend generateClass: umlClass.

	self assert: backend outputStream contents equals:
'class AClass <<(C,#FFFFFF)>> #FFFFFF {
  integer prop1
  whatever prop2
}
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateClassStub [
	| umlClass |
	umlClass := (self classNamed: 'AClass').
	umlClass beStub.

	backend generateClass: umlClass.

	self assert: backend outputStream contents equals:
'class AClass <<(C,#FFFFFF)External>> #FFFFFF {
}
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateInheritance [
	| umlLink |
	umlLink := self link: FamixUMLInheritance from: 'AClass' to: 'ASuperclass'.

	backend generateInheritance: umlLink.

	self assert: backend outputStream contents equals:
'ASuperclass <|-- AClass
'
]

{ #category : #tests }
FamixUMLPlantUMLBackendTest >> testGenerateUse [
	| umlLink |
	umlLink := self link: FamixUMLUse from: 'AClass' to: 'Trait'.

	backend generateUse: umlLink.

	self assert: backend outputStream contents equals:
'Trait <|.. AClass
'
]
