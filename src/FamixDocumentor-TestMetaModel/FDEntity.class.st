Class {
	#name : #FDEntity,
	#superclass : #MooseEntity,
	#category : #'FamixDocumentor-TestMetaModel-Entities'
}

{ #category : #meta }
FDEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FDEntity class >> isAbstract [

	<generated>
	^ self == FDEntity
]

{ #category : #meta }
FDEntity class >> metamodel [

	<generated>
	^ FDModel metamodel
]
