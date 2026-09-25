"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixTest7NamedEntity',
	#superclass : 'FamixTest7Entity',
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : 'Famix-Test7-Entities-Entities',
	#package : 'Famix-Test7-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest7NamedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NamedEntity super: #FamixTest7Entity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest7NamedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest7NamedEntity
]

{ #category : 'testing' }
FamixTest7NamedEntity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ true
]
