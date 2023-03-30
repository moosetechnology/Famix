Class {
	#name : #FamixTestComposed2SourcedEntity,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTestComposed2SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed2SourcedEntity
]
