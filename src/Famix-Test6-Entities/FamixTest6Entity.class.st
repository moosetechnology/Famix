Class {
	#name : #FamixTest6Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest6Entity class >> isAbstract [

	<generated>
	^ self == FamixTest6Entity
]

{ #category : #meta }
FamixTest6Entity class >> metamodel [

	<generated>
	^ FamixTest6Model metamodel
]

{ #category : #testing }
FamixTest6Entity >> isQueryable [

	<generated>
	^ false
]
