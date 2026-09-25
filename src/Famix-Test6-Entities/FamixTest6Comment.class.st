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
	#name : 'FamixTest6Comment',
	#superclass : 'FamixTest6SourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'Famix-Test6-Entities-Entities',
	#package : 'Famix-Test6-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest6Comment class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Comment super: #FamixTest6SourcedEntity>
	<package: #'Famix-Test6-Entities'>
	<generated>
]
