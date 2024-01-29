"
## Relations
======================

### Other
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
