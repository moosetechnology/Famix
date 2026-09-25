"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixTest6NamedEntity',
	#superclass : 'FamixTest6Entity',
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : 'Famix-Test6-Entities-Entities',
	#package : 'Famix-Test6-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest6NamedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NamedEntity super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest6NamedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest6NamedEntity
]

{ #category : 'testing' }
FamixTest6NamedEntity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ true
]
