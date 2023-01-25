Class {
	#name : #FamixTest3NamedEntity,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]
