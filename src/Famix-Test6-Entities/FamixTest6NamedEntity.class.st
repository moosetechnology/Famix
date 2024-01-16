"
## Properties
======================

| Name | Type | Default value | Comment |
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixTest6NamedEntity,
	#superclass : #FamixTest6Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest6NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest6NamedEntity
]
