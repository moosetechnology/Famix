"
An abstract test case to run tests both on a model and on the same model that got exported and imported again.

When persist is true, exportAndImportModelIfNeeded exports the model, re-imports it, and swaps the model instance variable for the freshly imported one, so inter-entity references still resolve inside a single model.

LIMITATION: after a round trip the imported entities are new instances, so identity-based assertions only keep working because every instance variable holding a named entity is rebound to its imported counterpart (looked up by mooseName). Entities without a unique mooseName in the model, such as source-text anchors (mooseName is #noname), are NOT rebound. Subclasses must therefore not store such entities in instance variables; instead derive them from a named entity, e.g. anchor1 ^ m1 sourceAnchor.
"
Class {
	#name : 'FamixAbstractExportTestCase',
	#superclass : 'ParametrizedTestCase',
	#instVars : [
		'persist',
		'model'
	],
	#category : 'Famix-Tests',
	#package : 'Famix-Tests'
}

{ #category : 'private' }
FamixAbstractExportTestCase class >> isAbstract [

	^ self = FamixAbstractExportTestCase
]

{ #category : 'building suites' }
FamixAbstractExportTestCase class >> testParameters [

	^ ParametrizedTestMatrix new forSelector: #persist addOptions: { false. true }
]

{ #category : 'running' }
FamixAbstractExportTestCase >> exportAndImportModelIfNeeded [
	"Replaces the model and the test's entity instance variables by their freshly imported counterparts, keeping identity-based assertions working after a persistence round trip."

	| json oldModel newModel |
	self persist ifFalse: [ ^ self ].

	"Import a fresh model from the exported JSON; the imported entities are new instances."
	json := model asJSONString.
	oldModel := model.
	newModel := json readStreamDo: [ :stream | model class new importFromJSONStream: stream ].
	model := newModel.

	"Rebind every entity instance variable to its imported counterpart, looked up by mooseName. The originals still belong to the old model, which is how we recognize them."
	self class allInstVarNames do: [ :ivarName |
			| value |
			value := self instVarNamed: ivarName.
			(value isMooseEntity and: [ value mooseModel == oldModel ]) ifTrue: [
				(newModel entityNamed: value mooseName) ifNotNil: [ :importedEntity | self instVarNamed: ivarName put: importedEntity ] ] ]
]

{ #category : 'running' }
FamixAbstractExportTestCase >> performTest [

	self exportAndImportModelIfNeeded.
	super performTest
]

{ #category : 'accessing' }
FamixAbstractExportTestCase >> persist [
	^ persist
]

{ #category : 'accessing' }
FamixAbstractExportTestCase >> persist: anObject [
	persist := anObject
]
