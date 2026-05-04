Class {
	#name : 'FmxMBClassTest',
	#superclass : 'FmxMBBehaviorTest',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'accessing' }
FmxMBClassTest >> behaviorClass [

	^ FmxMBClass
]

{ #category : 'accessing' }
FmxMBClassTest >> newEntityNamed: aString [

	^ builder newClassNamed: aString
]

{ #category : 'tests - names' }
FmxMBClassTest >> testCannotHaveTwoSuperclasses [

	| class1 class2 class3 |
	class1 := builder newClassNamed: #Class1.
	class2 := builder newClassNamed: #Class2.
	class3 := builder newClassNamed: #Class3.


	class1 --|> class2.
	self should: [ class1 --|> class3 ] raise: Error
]

{ #category : 'tests - names' }
FmxMBClassTest >> testSingularPropertyName [

	"test if singularPropertyName is correctly created from a class name"

	| class |
		
	class := builder newClassNamed: #Variable.	
	self assert: class singularPropertyName equals: 'variable'.
		
	class := builder newClassNamed: #Access.	
	self assert: class singularPropertyName equals: 'access'.

	class := builder newClassNamed: #Method.	
	self assert: class singularPropertyName equals: 'method'.

]

{ #category : 'tests - tags' }
FmxMBClassTest >> testTestingMethods [
	"test messages isMetamodelClass and isMetamodelTrait"

	| named |
	named := builder newClassNamed: #Named.

	self assert: named isMetamodelClass.
	self deny: named isMetamodelTrait
]
