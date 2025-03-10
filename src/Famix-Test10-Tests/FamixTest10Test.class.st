Class {
	#name : #FamixTest10Test,
	#superclass : #TestCase,
	#category : #'Famix-Test10-Tests'
}

{ #category : #running }
FamixTest10Test >> tearDown [

	FamixTest10Generator packageName asPackageIfAbsent: [
		^ super tearDown ].
	FamixTest10Generator deleteMetaModel.
	super tearDown
]

{ #category : #tests }
FamixTest10Test >> testRegenerationWithSlightDifferenceFromScratchWorks [

	FamixTest10Generator generate.
	FamixTest10Generator deleteMetaModel.

	FamixTest10BisGenerator generate.

	"Explicitly check that the default value is true"
	self
		assert:
			((self class environment at: #FamixTest10MyClass) slotNamed:
				 #isTasty) defaultValue
		equals: true
]

{ #category : #tests }
FamixTest10Test >> testRegenerationWithSlightDifferenceRedefinesSlotDefaultValue [

	FamixTest10Generator generate.
	FamixTest10BisGenerator generate.

	"Explicitly check that the default value is true"
	self
		assert:
			((self class environment at: #FamixTest10MyClass) slotNamed:
				 #isTasty) defaultValue
		equals: true
]
