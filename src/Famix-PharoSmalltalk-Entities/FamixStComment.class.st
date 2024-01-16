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
	#name : #FamixStComment,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStComment class >> annotation [

	<FMClass: #Comment super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixStComment >> belongsTo [

	^ self commentedEntity
]
