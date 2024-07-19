Class {
	#name : #FamixTest9Test,
	#superclass : #TestCase,
	#category : #'Famix-Test9-Tests'
}

{ #category : #running }
FamixTest9Test >> tearDown [

	FamixTest9Generator deleteMetaModel.
	super tearDown
]

{ #category : #tests }
FamixTest9Test >> testRegenerationWithSlightDifferencesFromScratchWorks [

	"We generate the meta-model"
	FamixTest9Generator generate.
	
	"We remove it entirely, and we generate a slightly different version of it"
	FamixTest9Generator deleteMetaModel.
	FamixTest9BisGenerator generate.
	
	self assert: ((self class environment at: #FamixTest9MySubclass) definesSlotNamed: #mySuperclass).
	self assert: ((self class environment at: #FamixTest9MySuperclass) definesSlotNamed: #mySubclasses)
]

{ #category : #tests }
FamixTest9Test >> testRegenerationWithSlightDifferencesRedefinesRelation [
	"This is a smoke test checking that generation does not fail"

	"We generate the meta-model"

	FamixTest9Generator generate.

	FamixTest9BisGenerator generate.

	self assert: ((self class environment at: #FamixTest9MySubclass) definesSlotNamed: #mySuperclass).
	self assert: ((self class environment at: #FamixTest9MySuperclass) definesSlotNamed: #mySubclasses)
]
