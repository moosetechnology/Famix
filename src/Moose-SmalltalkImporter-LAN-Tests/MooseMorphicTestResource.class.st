Class {
	#name : #MooseMorphicTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #setup }
MooseMorphicTestResource >> importModel [
	| importer |
	importer := FamixStPharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer
		runCandidateOperator;
		model: model;
		addFromPackagesNamed: (MooseScripts packageNamesFor: 'Morphic*');
		runWithProgress
]
