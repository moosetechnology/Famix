Class {
	#name : #FamixTestComposed2NamedEntity,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	<abstract>
	^self
]

{ #category : #testing }
FamixTestComposed2NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed2NamedEntity
]
