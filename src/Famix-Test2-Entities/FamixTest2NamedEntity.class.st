"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixTest2NamedEntity,
	#superclass : #FamixTest2Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTest2Entity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest2NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest2NamedEntity
]

{ #category : #testing }
FamixTest2NamedEntity >> isNamedEntity [

	<generated>
	^ true
]
