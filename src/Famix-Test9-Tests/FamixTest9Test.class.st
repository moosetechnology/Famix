"
Checks that regenerating the FamixTest9 meta-model with slight differences updates the already generated entities, both when the meta-model is deleted first and when it is regenerated in place. The differences are introduced by FamixTest9BisGenerator: the targets of the relation between the two entities are changed and a default value is added to a property.
"
Class {
	#name : 'FamixTest9Test',
	#superclass : 'TestCase',
	#category : 'Famix-Test9-Tests',
	#package : 'Famix-Test9-Tests'
}

{ #category : 'running' }
FamixTest9Test >> tearDown [

	FamixTest9Generator packageName asPackageIfAbsent: [ ^ super tearDown ].
	FamixTest9Generator deleteMetaModel.
	super tearDown
]

{ #category : 'tests' }
FamixTest9Test >> testRegenerationWithSlightDifferencesFromScratchAppliesDefaultValue [

	FamixTest9Generator generate.
	FamixTest9Generator deleteMetaModel.

	FamixTest9BisGenerator generate.

	"Explicitly check that the default value is true"
	self assert: ((self class environment at: #FamixTest9MyClass) slotNamed: #isTasty) defaultValue equals: true
]

{ #category : 'tests' }
FamixTest9Test >> testRegenerationWithSlightDifferencesFromScratchWorks [

	"We generate the meta-model"
	FamixTest9Generator generate.
	
	"We remove it entirely, and we generate a slightly different version of it"
	FamixTest9Generator deleteMetaModel.
	FamixTest9BisGenerator generate.
	
	self assert: ((self class environment at: #FamixTest9MySubclass) definesSlotNamed: #mySuperclass).
	self assert: ((self class environment at: #FamixTest9MySuperclass) definesSlotNamed: #mySubclasses)
]

{ #category : 'tests' }
FamixTest9Test >> testRegenerationWithSlightDifferencesRedefinesRelation [
	"This is a smoke test checking that generation does not fail"

	"We generate the meta-model"

	FamixTest9Generator generate.

	FamixTest9BisGenerator generate.

	self assert: ((self class environment at: #FamixTest9MySubclass) definesSlotNamed: #mySuperclass).
	self assert: ((self class environment at: #FamixTest9MySuperclass) definesSlotNamed: #mySubclasses)
]

{ #category : 'tests' }
FamixTest9Test >> testRegenerationWithSlightDifferencesRedefinesSlotDefaultValue [

	FamixTest9Generator generate.

	FamixTest9BisGenerator generate.

	"Explicitly check that the default value is true"
	self assert: ((self class environment at: #FamixTest9MyClass) slotNamed: #isTasty) defaultValue equals: true
]
