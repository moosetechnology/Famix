Class {
	#name : #MoosePharoImporterTaskTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #tests }
MoosePharoImporterTaskTest >> testDefaultModel [
	self assert: (MoosePharoImporterTask new model isKindOf: MooseModel)
]

{ #category : #tests }
MoosePharoImporterTaskTest >> testImportedModelHasSmalltalkMetamodel [
	| model |
	model := MoosePharoImporterTask new
		model: FamixStModel new;
		addFromPackageNamed: 'Moose-SmalltalkImporter-Core-Tests';
		basicRun.
	self assert: model metamodel equals: FamixStModel metamodel
]
