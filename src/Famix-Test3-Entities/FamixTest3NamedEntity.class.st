"
## Properties
======================

| Name | Type | Comment |
| `name` | String | Basic name of the entity, not full reference.|

"
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
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest3NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest3NamedEntity
]
