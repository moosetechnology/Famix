Class {
	#name : #FamixTestComposed1NamedEntity,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixTestComposed1NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed1NamedEntity
]
