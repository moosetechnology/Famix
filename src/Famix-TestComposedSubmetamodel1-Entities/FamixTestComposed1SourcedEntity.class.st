Class {
	#name : #FamixTestComposed1SourcedEntity,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	<abstract>
	^self
]

{ #category : #testing }
FamixTestComposed1SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed1SourcedEntity
]
