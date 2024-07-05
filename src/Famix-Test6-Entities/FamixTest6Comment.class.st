"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | Content of the comment as a String|

"
Class {
	#name : #FamixTest6Comment,
	#superclass : #FamixTest6SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6Comment class >> annotation [

	<FMClass: #Comment super: #FamixTest6SourcedEntity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]
