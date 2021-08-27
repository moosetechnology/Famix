Class {
	#name : #FamixTest1SlotUpdateTest,
	#superclass : #TestCase,
	#instVars : [
		'class',
		'method'
	],
	#category : #'Famix-Test-Slots-Update'
}

{ #category : #initialization }
FamixTest1SlotUpdateTest >> instantiate: aClassSymbol named: anInstanceName [

	^ (aClassSymbol asClassInEnvironment: self class environment) new
		  name: anInstanceName;
		  yourself
]

{ #category : #initialization }
FamixTest1SlotUpdateTest >> modifySuperclass [

	| sc |
	sc := #FmxSlotTestSourcedEntity asClassInEnvironment:
		      self class environment.
	sc addSlot: #var
]

{ #category : #initialization }
FamixTest1SlotUpdateTest >> setUp [

	super setUp.


	FamixSlotTestGenerator generate.
	class := self instantiate: #FmxSlotTestClass named: 'ExampleClass'.
	method := self instantiate: #FmxSlotTestMethod named: #exampleMethod.

	class addMethod: method.
	self modifySuperclass
]

{ #category : #initialization }
FamixTest1SlotUpdateTest >> tearDown [

	super tearDown.

	FamixSlotTestGenerator packageName asPackage removeFromSystem
]

{ #category : #initialization }
FamixTest1SlotUpdateTest >> testCanAddNewMethods [

	| newMethod |
	newMethod := self
		             instantiate: #FmxSlotTestMethod
		             named: #otherNewNewMethod.
	class addMethod: newMethod.
	self assert: (class methods includes: newMethod)
]

{ #category : #initialization }
FamixTest1SlotUpdateTest >> testCanGetMethods [

	self assert: (class methods allSatisfy: [ :m | m parentType = class ])
]

{ #category : #initialization }
FamixTest1SlotUpdateTest >> testCanRemoveMethods [

	self assert: class methods size equals: 2.
	self assert: (class methods includes: method).
	self assert: method parentType equals: class.
	class methods remove: method.
	class methods remove: method.
	self deny: (class methods includes: method).
	self assert: method parentType isNil
]
