Class {
	#name : #FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #setup }
FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource >> importModel [

	| importer |
	importer := FamixStPharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer
		doNotRunCandidateOperator;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-Reference-Core';
		run
]
