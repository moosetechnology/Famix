Class {
	#name : 'MooseObjectTest',
	#superclass : 'TestCase',
	#category : 'Moose-Core-Tests',
	#package : 'Moose-Core-Tests'
}

{ #category : 'testing' }
MooseObjectTest class >> shouldInheritSelectors [
	^ true
]

{ #category : 'helpers' }
MooseObjectTest >> actualClass [
	^ MooseObject
]

{ #category : 'tests' }
MooseObjectTest >> testAllMooseDisplayOn [

	| t ins |
	self withConcreteSubclasses do: [ :cls | 
		ins := cls new.
		self shouldnt: [ t := ins displayString ] raise: Error.
		self assert: t isByteString.
		self
			assert: (String streamContents: [ :s | ins displayStringOn: s ])
			equals: t ]
]

{ #category : 'tests' }
MooseObjectTest >> testAllMooseNameOn [
	| t ins |
	self actualClass allSubclasses
		do: [ :cls | 
			ins := cls new.
			self shouldnt: [ t := ins mooseName ] raise: Error.
			self assert: (String streamContents: [ :s | ins mooseNameOn: s ]) equals: t ]
]

{ #category : 'tests' }
MooseObjectTest >> testAllPrintOn [
	| t ins |
	self withConcreteSubclasses
		do: [ :cls | 
			ins := cls new.
			self shouldnt: [ t := ins printString ] raise: Error.
			self assert: t isByteString.
			self assert: (String streamContents: [ :s | ins printOn: s ]) equals: t ]
]

{ #category : 'tests' }
MooseObjectTest >> testAllPrinting [
	| entity |
	self withConcreteSubclasses
		do: [ :cls | 
			entity := cls new.
			self assert: (String streamContents: [ :s | entity printOn: s ]) equals: entity printString ]
]

{ #category : 'tests' }
MooseObjectTest >> testAttributeAtPut [

	| mooseObject attributeValue |
	mooseObject := self actualClass new.
	attributeValue := 'An attribute'.

	"Putting the value in the attribute collection returns the value"
	self
		assert:
		(mooseObject attributeAt: #testAttribute put: attributeValue)
		equals: attributeValue.

	"The value has been put in the attribute collection"
	self
		assert: (mooseObject attributeAt: #testAttribute)
		equals: attributeValue
]

{ #category : 'tests' }
MooseObjectTest >> testGroupFor [
	| entity1 entity2 model classGroup methodGroup |
	entity1 := FamixTest1Class new.
	entity2 := FamixTest1Class new.
	model := FamixTest1Model new.
	model addAll: {entity1 . entity2}.
	classGroup := model groupFor: #allClasses.
	self assert: classGroup class identicalTo: FamixClassGroup.
	self assert: (classGroup entities includesAll: {entity1 . entity2}).
	methodGroup := model groupFor: #allMethods.
	self assert: methodGroup class identicalTo: MooseSpecializedGroup.
	self assertEmpty: methodGroup
]

{ #category : 'tests' }
MooseObjectTest >> testId [
	self actualClass setMooseID: SmallInteger maxVal - 2.
	self should: [ 10 timesRepeat: [ self actualClass freshID ] ] raise: Notification
]

{ #category : 'tests' }
MooseObjectTest >> testMooseName [
	self assert: Smalltalk mooseName equals: #Smalltalk
]

{ #category : 'tests' }
MooseObjectTest >> testPrintOnWithError [
	| entity printString |
	entity := self actualClass new.
	entity stub mooseName willRaise: Error new.
	printString := String streamContents: [ :stream | entity printOn: stream ].
	self assert: (printString endsWith: 'Error printing the object''')
]

{ #category : 'tests' }
MooseObjectTest >> testResetIDGeneration [
	self actualClass freshID.
	self actualClass resetIDGeneration.
	self assert: self actualClass freshID equals: 1
]

{ #category : 'tests' }
MooseObjectTest >> testValueOfFameProperty [

	| entity property |
	entity := FamixTest1Method named: 'Test'.
	property := entity mooseDescription propertyNamed: #name.

	self assert: (entity valueOfFameProperty: property) equals: 'Test'
]

{ #category : 'tests' }
MooseObjectTest >> testValueOfFamePropertyWithWrongProperty [

	| entity property |
	entity := FamixTest1Method named: 'Test'.
	property := FamixTest1Attribute mooseDescription propertyNamed: #numberOfAccesses.

	"This property does not exist on a method so it should return nil with the current implementation"
	self assert: (entity valueOfFameProperty: property) isNil
]

{ #category : 'tests' }
MooseObjectTest >> withConcreteSubclasses [
	^ self actualClass withAllSubclasses reject: #isAbstract
]
