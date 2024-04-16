Class {
	#name : #FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #setup }
FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource >> importModel [

	FamixStPharoImporterTask new importingContext
		mergeClassAndMetaclass;
		doNotRunCandidateOperator;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-Reference-Core';
		run
]
