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
	#name : #FamixTest1Comment,
	#superclass : #FamixTest1SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Comment class >> annotation [

	<FMClass: #Comment super: #FamixTest1SourcedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
