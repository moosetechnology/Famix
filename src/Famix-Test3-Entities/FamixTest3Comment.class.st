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
	#name : #FamixTest3Comment,
	#superclass : #FamixTest3SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Comment class >> annotation [

	<FMClass: #Comment super: #FamixTest3SourcedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
