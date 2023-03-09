Class {
	#name : #FamixTestComposedEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	<abstract>
	^self
]

{ #category : #testing }
FamixTestComposedEntity class >> isAbstract [

	<generated>
	^ self == FamixTestComposedEntity
]

{ #category : #meta }
FamixTestComposedEntity class >> metamodel [

	<generated>
	^ FamixTestComposedModel metamodel
]

{ #category : #testing }
FamixTestComposedEntity >> isAssociation [

	<generated>
	^ false
]
