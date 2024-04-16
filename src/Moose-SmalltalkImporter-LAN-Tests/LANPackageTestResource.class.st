Class {
	#name : #LANPackageTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #hook }
LANPackageTestResource >> importModel [

	FamixStPharoImporterTask new
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run
]
