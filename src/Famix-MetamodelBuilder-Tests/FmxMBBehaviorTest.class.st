Class {
	#name : 'FmxMBBehaviorTest',
	#superclass : 'FmxMBTestCase',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'testing' }
FmxMBBehaviorTest class >> isAbstract [

	^ self name = #FmxMBBehaviorTest
]

{ #category : 'accessing' }
FmxMBBehaviorTest >> behaviorClass [

	self subclassResponsibility 
]

{ #category : 'accessing' }
FmxMBBehaviorTest >> newEntityNamed: aString [

	self subclassResponsibility 
]

{ #category : 'tests' }
FmxMBBehaviorTest >> testCustomTestingSelectors [

	"test automatic generation of custom testing selector"

	| simpleClass |
	
	simpleClass := self newEntityNamed: #Comment.	
	simpleClass testingSelector: #isAComment.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isAComment).
	simpleClass testingSelector: #isADocumentation.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isAComment isADocumentation).
	

]

{ #category : 'tests' }
FmxMBBehaviorTest >> testCustomTestingSelectorsAtOnce [

	"test automatic generation of custom testing selector defined at once"

	| simpleClass |
	
	simpleClass := self newEntityNamed: #Comment.	
	simpleClass testingSelectors: #(isAComment isADocumentation).
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isAComment isADocumentation).
	

]

{ #category : 'tests' }
FmxMBBehaviorTest >> testPluralOf [

	| behavior | 
	
	behavior := FmxMBBehavior new.
	
	self assert: (behavior pluralOf: 'object') equals: 'objects'.
	self assert: (behavior pluralOf: 'class') equals: 'classes'.	
	self assert: (behavior pluralOf: 'entity') equals: 'entities'.	

	self assert: (behavior pluralOf: 'object1') equals: 'objects1'.
	self assert: (behavior pluralOf: 'class12') equals: 'classes12'.
	self assert: (behavior pluralOf: 'entity123') equals: 'entities123'.

]

{ #category : 'tests' }
FmxMBBehaviorTest >> testTestingSelectors [
	"test automatic generation of testing methods in the entities hierarchy"

	| simpleClass |
	simpleClass := self newEntityNamed: #Comment.
	self assertEmpty: simpleClass testingSelectors.
	simpleClass withTesting.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isComment)
]
