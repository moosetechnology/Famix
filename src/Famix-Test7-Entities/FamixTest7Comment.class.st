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
	#name : #FamixTest7Comment,
	#superclass : #FamixTest7SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7Comment class >> annotation [

	<FMClass: #Comment super: #FamixTest7SourcedEntity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]
