Class {
	#name : 'FDEntity',
	#superclass : 'MooseEntity',
	#category : 'FamixDocumentor-TestMetaModel-Entities',
	#package : 'FamixDocumentor-TestMetaModel',
	#tag : 'Entities'
}

{ #category : 'meta' }
FDEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FDEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FDEntity
]

{ #category : 'meta' }
FDEntity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FDModel metamodel
]
