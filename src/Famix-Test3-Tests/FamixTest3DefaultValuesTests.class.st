"
Tests that the FamixTest3 metamodel applies default values to generated properties, including inheritance from Room to Classroom (ported from FamixTest6Test).
"
Class {
	#name : #FamixTest3DefaultValuesTests,
	#superclass : #TestCase,
	#category : #'Famix-Test3-Tests'
}

{ #category : #tests }
FamixTest3DefaultValuesTests >> testDefaultValueEmptyString [

	| room purposeProperty newPurpose |
	room := FamixTest3Room new.
	purposeProperty := room metadescription properties detect: [ :each | each name = #purpose ].

	self assert: room purpose equals: ''.
	self assert: purposeProperty defaultValue equals: ''.

	newPurpose := 'Chemistry laboratory'.
	room purpose: newPurpose.
	self assert: room purpose equals: newPurpose.
	self assert: purposeProperty defaultValue equals: ''
]

{ #category : #tests }
FamixTest3DefaultValuesTests >> testDefaultValueOnCreation [

	| room windowProperty |
	room := FamixTest3Room new.
	windowProperty := (room metadescription properties select: [ :each | each name = #hasWindows ]) at: 1.

	self assert: room hasWindows.
	self assert: windowProperty defaultValue.

	room hasWindows: false.
	self deny: room hasWindows.
	self assert: windowProperty defaultValue
]

{ #category : #tests }
FamixTest3DefaultValuesTests >> testDefaultValueOnCreation2 [

	| room capacityProperty |
	room := FamixTest3Room new.
	capacityProperty := (room metadescription properties select: [ :each | each name = #capacity ]) at: 1.

	self assert: room capacity equals: 12.
	self assert: capacityProperty defaultValue equals: 12.

	room capacity: 0.
	self assert: room capacity equals: 0.
	self assert: capacityProperty defaultValue equals: 12
]

{ #category : #tests }
FamixTest3DefaultValuesTests >> testDefaultValueOnCreationInheritance [

	| classroom |
	classroom := FamixTest3Classroom new.

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
