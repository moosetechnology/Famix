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
	#name : #FamixTestComposed2Comment,
	#superclass : #FamixTestComposed2SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Comment class >> annotation [

	<FMClass: #Comment super: #FamixTestComposed2SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^ self
]
