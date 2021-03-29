Class {
	#name : #FamixTest1Method,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTMethod + FamixTWithSourceLanguages',
	#classTraits : 'FamixTMethod classTrait + FamixTWithSourceLanguages classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Method class >> annotation [

	<FMClass: #Method super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
