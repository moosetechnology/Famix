"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : #FamixTest2Comment,
	#superclass : #FamixTest2SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Comment class >> annotation [

	<FMClass: #Comment super: #FamixTest2SourcedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^ self
]
