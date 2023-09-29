Class {
	#name : #MooseMSEImporterTestSourceAnchor,
	#superclass : #MooseMSEImporterTestEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestSourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #MooseMSEImporterTestEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
MooseMSEImporterTestSourceAnchor class >> isAbstract [

	<generated>
	^ self == MooseMSEImporterTestSourceAnchor
]
