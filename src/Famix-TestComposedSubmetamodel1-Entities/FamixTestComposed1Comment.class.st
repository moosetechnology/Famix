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
	#name : #FamixTestComposed1Comment,
	#superclass : #FamixTestComposed1SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Comment class >> annotation [

	<FMClass: #Comment super: #FamixTestComposed1SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^ self
]
