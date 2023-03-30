Class {
	#name : #MooseMSEImporterTestNamespace,
	#superclass : #MooseMSEImporterTestNamedEntity,
	#traits : 'FamixTNamespace + FamixTWithClasses',
	#classTraits : 'FamixTNamespace classTrait + FamixTWithClasses classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestNamespace class >> annotation [

	<FMClass: #Namespace super: #MooseMSEImporterTestNamedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
