"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `commentedEntity` | `FamixTWithComments` | `comments` | Source code commented by the comment|


## Properties
======================

| Name | Type | Comment |
| `content` | String | Content of the comment as a String|

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
