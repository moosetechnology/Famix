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
