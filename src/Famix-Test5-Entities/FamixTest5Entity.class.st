Class {
	#name : #FamixTest5Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	<abstract>
	^self
]

{ #category : #testing }
FamixTest5Entity class >> isAbstract [

	<generated>
	^ self == FamixTest5Entity
]

{ #category : #meta }
FamixTest5Entity class >> metamodel [

	<generated>
	^ FamixTest5Model metamodel
]
