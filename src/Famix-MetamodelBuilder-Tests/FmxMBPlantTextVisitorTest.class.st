"
A FmxMBPlantTextVisitorTest is a test class for testing the behavior of FmxMBPlantTextVisitor
"
Class {
	#name : #FmxMBPlantTextVisitorTest,
	#superclass : #TestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBPlantTextVisitorTest >> testRecordGeneralizationsForClassMergingTraits [
	| b v |
	b :=  FamixTest4Generator builderWithDefinitions.
	v :=  FmxMBPlantTextVisitor new.
	b acceptVisitor: v.
	self assert: (v contents includesSubstring: 'behavior2 <|-- behavior6').
	self assert: (v contents includesSubstring: 'behavior2 <|-- behavior7').
	self assert: (v contents includesSubstring: 'behavior2 <|-- behavior8').
	self assert: (v contents includesSubstring: 'behavior4 <|-- behavior9').
	self assert: (v contents includesSubstring: 'behavior4 <|-- behavior10').
	
	self assert: (v contents includesSubstring: 'behavior7 "students * " -[#red]-o "school  " behavior3').
	self assert: (v contents includesSubstring: 'behavior3 "school  " o-[#red]- "rooms * " behavior4').
	self assert: (v contents includesSubstring: 'behavior8 "teachers * " -[#red]-o "school  " behavior3').
	self assert: (v contents includesSubstring: 'behavior7 "students * " -[#black]- "teachers * " behavior8').
	self assert: (v contents includesSubstring: 'behavior1 "books * " -[#red]-o "person  " behavior2').
	self assert: (v contents includesSubstring: 'behavior6 "principal  " -[#red]-o "school  " behavior3').
]

{ #category : #tests }
FmxMBPlantTextVisitorTest >> testRecordGeneralizationsForTrait [
	| b v |
	b :=  FmxMBTestOnlyTraits1Generator builderWithDefinitions.
	v :=  FmxMBPlantTextVisitor new withAllTraits.
	b acceptVisitor: v.
	self assert: (v contents includesSubstring: 'behavior1 <|-- behavior2').
	self assert: (v contents includesSubstring: 'behavior1 <|-- behavior3').
	self assert: (v contents includesSubstring: 'behavior1 "as * " -[#black]- "bs * " behavior2').
]
