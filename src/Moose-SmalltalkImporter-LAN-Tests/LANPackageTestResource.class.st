Class {
	#name : #LANPackageTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #hook }
LANPackageTestResource >> importModel [
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run
]
