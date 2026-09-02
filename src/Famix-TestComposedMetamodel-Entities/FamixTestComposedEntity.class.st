Class {
	#name : 'FamixTestComposedEntity',
	#superclass : 'MooseEntity',
	#category : 'Famix-TestComposedMetamodel-Entities-Entities',
	#package : 'Famix-TestComposedMetamodel-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTestComposedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTestComposedEntity
]

{ #category : 'meta' }
FamixTestComposedEntity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTestComposedModel metamodel
]

{ #category : 'testing' }
FamixTestComposedEntity >> isAssociation [

	<ignoreForCoverage>
	<generated>
	^ false
]
