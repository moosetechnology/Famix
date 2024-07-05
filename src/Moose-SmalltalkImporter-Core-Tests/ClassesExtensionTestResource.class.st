Class {
	#name : #ClassesExtensionTestResource,
	#superclass : #MooseModelTestResource,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #hook }
ClassesExtensionTestResource >> importModel [

	FamixStImporter new model: model; addPackageNamed: 'ReferenceModel' ; run.
]
