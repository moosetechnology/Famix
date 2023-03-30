Class {
	#name : #MooseMSEImporterTestClass,
	#superclass : #MooseMSEImporterTestNamedEntity,
	#traits : 'FamixTClass + FamixTSourceEntity',
	#classTraits : 'FamixTClass classTrait + FamixTSourceEntity classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestClass class >> annotation [

	<FMClass: #Class super: #MooseMSEImporterTestNamedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]

{ #category : #printing }
MooseMSEImporterTestClass >> mooseNameOn: aStream [

	self typeContainer ifNotNil: [ :parent | 
		parent mooseNameOn: aStream.
		aStream nextPutAll: '::' ].
	self name ifNotNil: [ :n | aStream nextPutAll: n ]
]
