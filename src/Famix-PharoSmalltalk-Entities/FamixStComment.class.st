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
	#name : 'FamixStComment',
	#superclass : 'FamixStSourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'Famix-PharoSmalltalk-Entities-Entities',
	#package : 'Famix-PharoSmalltalk-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixStComment class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Comment super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixStComment >> belongsTo [

	^ self commentedEntity
]
