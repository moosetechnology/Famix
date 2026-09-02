"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixTest3NamedEntity',
	#superclass : 'FamixTest3Entity',
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3NamedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NamedEntity super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest3NamedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest3NamedEntity
]

{ #category : 'testing' }
FamixTest3NamedEntity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ true
]
