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
	#name : #FamixJavaComment,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaComment class >> annotation [

	<FMClass: #Comment super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #converting }
FamixJavaComment >> asFamixJavaComment [
	^ self
]

{ #category : #deprecated }
FamixJavaComment >> belongsTo [
	
	^ self container
]
