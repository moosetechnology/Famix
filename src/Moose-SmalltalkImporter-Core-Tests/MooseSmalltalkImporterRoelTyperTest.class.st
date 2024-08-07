Class {
	#name : #MooseSmalltalkImporterRoelTyperTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #tests }
MooseSmalltalkImporterRoelTyperTest >> testASTCore [
	| model importer |
	model := FamixStModel new.
	self timeLimit: 60 seconds.
	importer := FamixStPharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.	";
		computeTypeOfAttributes"
	importer runCandidateOperator.
	self
		shouldnt: [ importer
				model: model;
				addFromPackagesNamed: #('AST-Core');
				run ]
		raise: Error.
	self denyEmpty: model
]
