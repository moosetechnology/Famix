Class {
	#name : #MooseMSEImporterTestAttribute,
	#superclass : #MooseMSEImporterTestNamedEntity,
	#traits : 'FamixTAttribute + FamixTSourceEntity',
	#classTraits : 'FamixTAttribute classTrait + FamixTSourceEntity classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestAttribute class >> annotation [

	<FMClass: #Attribute super: #MooseMSEImporterTestNamedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
