Class {
	#name : #MooseMSEImporterTestPackage,
	#superclass : #MooseMSEImporterTestNamedEntity,
	#traits : 'FamixTPackage + FamixTPackageable + FamixTWithClasses',
	#classTraits : 'FamixTPackage classTrait + FamixTPackageable classTrait + FamixTWithClasses classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestPackage class >> annotation [

	<FMClass: #Package super: #MooseMSEImporterTestNamedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
