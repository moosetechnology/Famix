Class {
	#name : #FamixReferenceModelNamespaceTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #setup }
FamixReferenceModelNamespaceTestResource >> importModel [

	FamixStPharoImporterTask new
		model: model;
		doNotRunCandidateOperator;
		addFromPackageNamed: #'Moose-TestResources-Reference-Core';
		addFromPackageNamed: #'Moose-TestResources-Reference-PackageOne';
		addFromPackageNamed: #'Moose-TestResources-Reference-PackageTwo';
		run
]
