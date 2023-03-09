Class {
	#name : #MooseMSEImporterTestSourcedEntity,
	#superclass : #MooseMSEImporterTestEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #MooseMSEImporterTestEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	<abstract>
	^self
]

{ #category : #testing }
MooseMSEImporterTestSourcedEntity class >> isAbstract [

	<generated>
	^ self == MooseMSEImporterTestSourcedEntity
]
