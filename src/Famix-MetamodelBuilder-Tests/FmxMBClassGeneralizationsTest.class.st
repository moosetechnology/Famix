Class {
	#name : 'FmxMBClassGeneralizationsTest',
	#superclass : 'FmxMBTestCase',
	#instVars : [
		'named',
		'behavior',
		'class'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
FmxMBClassGeneralizationsTest >> checkHierarchy [
	self assertEmpty: named allClassGeneralizations.
	self assertCollection: behavior allClassGeneralizations hasSameElements: {named}.
	self assertCollection: class allClassGeneralizations hasSameElements: {named . behavior}
]

{ #category : 'running' }
FmxMBClassGeneralizationsTest >> setUp [

	super setUp.

	named := builder newClassNamed: #Named.	
	behavior := builder newClassNamed: #Behavior.	
	class := builder newClassNamed: #Class.

]

{ #category : 'tests' }
FmxMBClassGeneralizationsTest >> testAllClassGeneralizations [
	
	named <|-- behavior.
	behavior <|-- class.
	
	self checkHierarchy.
]

{ #category : 'tests' }
FmxMBClassGeneralizationsTest >> testAllClassGeneralizationsInChain [
	
	named <|-- behavior <|-- class.
	
	self checkHierarchy.
]

{ #category : 'tests' }
FmxMBClassGeneralizationsTest >> testAllClassGeneralizationsInChainInverted [
	
	class --|> behavior --|> named.
	
	self checkHierarchy.
]

{ #category : 'tests' }
FmxMBClassGeneralizationsTest >> testSubclassOf [
	
	behavior subclassOf: named. 
	class subclassOf: behavior.
	
	self checkHierarchy.
]
