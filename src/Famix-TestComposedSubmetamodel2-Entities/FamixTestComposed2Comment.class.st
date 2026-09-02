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
	#name : 'FamixTestComposed2Comment',
	#superclass : 'FamixTestComposed2SourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'Famix-TestComposedSubmetamodel2-Entities-Entities',
	#package : 'Famix-TestComposedSubmetamodel2-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposed2Comment class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Comment super: #FamixTestComposed2SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
]
