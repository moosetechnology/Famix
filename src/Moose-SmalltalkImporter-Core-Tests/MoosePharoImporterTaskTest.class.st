Class {
	#name : #MoosePharoImporterTaskTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #tests }
MoosePharoImporterTaskTest >> testDefaultModel [
	self assert: (FamixStPharoImporterTask new model isKindOf: MooseModel)
]

{ #category : #tests }
MoosePharoImporterTaskTest >> testImportedModelHasSmalltalkMetamodel [
	| model |
	model := FamixStPharoImporterTask new
		model: FamixStModel new;
		addFromPackageNamed: 'Moose-SmalltalkImporter-Core-Tests';
		basicRun.
	self assert: model metamodel equals: FamixStModel metamodel
]
