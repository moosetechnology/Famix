"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixTest1NamedEntity,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest1NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest1NamedEntity
]

{ #category : #testing }
FamixTest1NamedEntity >> isNamedEntity [

	<generated>
	^ true
]
