Class {
	#name : #FamixTest8Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest8Entity class >> isAbstract [

	<generated>
	^ self == FamixTest8Entity
]

{ #category : #meta }
FamixTest8Entity class >> metamodel [

	<generated>
	^ FamixTest8Model metamodel
]

{ #category : #testing }
FamixTest8Entity >> isAssociation [

	<generated>
	^ false
]
