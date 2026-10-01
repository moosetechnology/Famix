"
Checks that regenerating the FamixTest4 meta-model with slight differences updates the already generated entities, both when the meta-model is deleted first and when it is regenerated in place. The differences are introduced by FamixTest4BisGenerator: the targets of the relation between the two entities are changed and a default value is added to a property.
"
Class {
	#name : #FamixTest4Test,
	#superclass : #TestCase,
	#category : #'Famix-Test4-Tests'
}

{ #category : #running }
FamixTest4Test >> tearDown [

	FamixTest4Generator packageName asPackageIfAbsent: [ ^ super tearDown ].
	FamixTest4Generator deleteMetaModel.
	super tearDown
]

{ #category : #tests }
FamixTest4Test >> testRegenerationWithSlightDifferencesFromScratchAppliesDefaultValue [

	FamixTest4Generator generate.
	FamixTest4Generator deleteMetaModel.

	FamixTest4BisGenerator generate.

	"Explicitly check that the default value is true"
	self assert: ((self class environment at: #FamixTest4MyClass) slotNamed: #isTasty) defaultValue equals: true
]

{ #category : #tests }
FamixTest4Test >> testRegenerationWithSlightDifferencesFromScratchWorks [

	"We generate the meta-model"
	FamixTest4Generator generate.
	
	"We remove it entirely, and we generate a slightly different version of it"
	FamixTest4Generator deleteMetaModel.
	FamixTest4BisGenerator generate.
	
	self assert: ((self class environment at: #FamixTest4MySubclass) definesSlotNamed: #mySuperclass).
	self assert: ((self class environment at: #FamixTest4MySuperclass) definesSlotNamed: #mySubclasses)
]

{ #category : #tests }
FamixTest4Test >> testRegenerationWithSlightDifferencesRedefinesRelation [
	"This is a smoke test checking that generation does not fail"

	"We generate the meta-model"

	FamixTest4Generator generate.

	FamixTest4BisGenerator generate.

	self assert: ((self class environment at: #FamixTest4MySubclass) definesSlotNamed: #mySuperclass).
	self assert: ((self class environment at: #FamixTest4MySuperclass) definesSlotNamed: #mySubclasses)
]

{ #category : #tests }
FamixTest4Test >> testRegenerationWithSlightDifferencesRedefinesSlotDefaultValue [

	FamixTest4Generator generate.

	FamixTest4BisGenerator generate.

	"Explicitly check that the default value is true"
	self assert: ((self class environment at: #FamixTest4MyClass) slotNamed: #isTasty) defaultValue equals: true
]
