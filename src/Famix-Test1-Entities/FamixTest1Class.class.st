"
This a comment for the Class entity
"
Class {
	#name : #FamixTest1Class,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTClass + FamixTSourceEntity + FamixTWithComments + FamixTWithSourceLanguages',
	#classTraits : 'FamixTClass classTrait + FamixTSourceEntity classTrait + FamixTWithComments classTrait + FamixTWithSourceLanguages classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Class class >> annotation [

	<FMClass: #Class super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
