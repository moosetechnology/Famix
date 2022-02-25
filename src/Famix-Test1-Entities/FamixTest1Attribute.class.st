Class {
	#name : #FamixTest1Attribute,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTAttribute + FamixTSourceEntity + FamixTWithSourceLanguages + FamixTest1TCanBeClassSide',
	#classTraits : 'FamixTAttribute classTrait + FamixTSourceEntity classTrait + FamixTWithSourceLanguages classTrait + FamixTest1TCanBeClassSide classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Attribute class >> annotation [

	<FMClass: #Attribute super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
