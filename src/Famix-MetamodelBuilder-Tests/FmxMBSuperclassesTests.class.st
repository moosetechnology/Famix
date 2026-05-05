Class {
	#name : 'FmxMBSuperclassesTests',
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
FmxMBSuperclassesTests >> checkHierarchy [

	self assertEmpty: named allSuperclasses.
	self assertCollection: behavior allSuperclasses hasSameElements: { named }.
	self assertCollection: class allSuperclasses hasSameElements: {
			named.
			behavior }
]

{ #category : 'running' }
FmxMBSuperclassesTests >> setUp [

	super setUp.

	named := builder newClassNamed: #Named.	
	behavior := builder newClassNamed: #Behavior.	
	class := builder newClassNamed: #Class.

]

{ #category : 'tests' }
FmxMBSuperclassesTests >> testAllSuperclasses [
	
	named <|-- behavior.
	behavior <|-- class.
	
	self checkHierarchy.
]

{ #category : 'tests' }
FmxMBSuperclassesTests >> testAllSuperclassesInChain [
	
	named <|-- behavior <|-- class.
	
	self checkHierarchy.
]

{ #category : 'tests' }
FmxMBSuperclassesTests >> testAllSuperclassesInChainInverted [
	
	class --|> behavior --|> named.
	
	self checkHierarchy.
]
