"
Tests that the FamixTest4 metamodel applies default values to generated properties, including inheritance from Room to Classroom (ported from FamixTest6Test).
"
Class {
	#name : 'FamixTest4DefaultValuesTests',
	#superclass : 'TestCase',
	#category : 'Famix-Test4-Tests',
	#package : 'Famix-Test4-Tests'
}

{ #category : 'tests' }
FamixTest4DefaultValuesTests >> testDefaultValueEmptyString [

	| room purposeProperty newPurpose |
	room := FamixTest4Room new.
	purposeProperty := room metadescription properties detect: [ :each | each name = #purpose ].

	self assert: room purpose equals: ''.
	self assert: purposeProperty defaultValue equals: ''.

	newPurpose := 'Chemistry laboratory'.
	room purpose: newPurpose.
	self assert: room purpose equals: newPurpose.
	self assert: purposeProperty defaultValue equals: ''
]

{ #category : 'tests' }
FamixTest4DefaultValuesTests >> testDefaultValueOnCreation [

	| room windowProperty |
	room := FamixTest4Room new.
	windowProperty := (room metadescription properties select: [ :each | each name = #hasWindows ]) at: 1.

	self assert: room hasWindows.
	self assert: windowProperty defaultValue.

	room hasWindows: false.
	self deny: room hasWindows.
	self assert: windowProperty defaultValue
]

{ #category : 'tests' }
FamixTest4DefaultValuesTests >> testDefaultValueOnCreation2 [

	| room capacityProperty |
	room := FamixTest4Room new.
	capacityProperty := (room metadescription properties select: [ :each | each name = #capacity ]) at: 1.

	self assert: room capacity equals: 12.
	self assert: capacityProperty defaultValue equals: 12.

	room capacity: 0.
	self assert: room capacity equals: 0.
	self assert: capacityProperty defaultValue equals: 12
]

{ #category : 'tests' }
FamixTest4DefaultValuesTests >> testDefaultValueOnCreationInheritance [

	| classroom |
	classroom := FamixTest4Classroom new.

	self assert: classroom hasProjector equals: false.
	self assert: classroom hasWindows equals: true.
	self assert: classroom capacity equals: 12.

	classroom hasProjector: true.
	classroom hasWindows: false.
	classroom capacity: 1.

	self assert: classroom hasProjector equals: true.
	self assert: classroom hasWindows equals: false.
	self assert: classroom capacity equals: 1
]
