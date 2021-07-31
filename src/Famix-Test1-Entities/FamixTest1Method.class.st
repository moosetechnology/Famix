Class {
	#name : #FamixTest1Method,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTHasKind + FamixTMethod + FamixTWithComments + FamixTWithSourceLanguages + FamixTest1TCanBeClassSide',
	#classTraits : 'FamixTHasKind classTrait + FamixTMethod classTrait + FamixTWithComments classTrait + FamixTWithSourceLanguages classTrait + FamixTest1TCanBeClassSide classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Method class >> annotation [

	<FMClass: #Method super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
