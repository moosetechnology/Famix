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
	#name : 'MooseMSEImporterTestComment',
	#superclass : 'MooseMSEImporterTestSourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'Moose-Core-Tests-Entities-Entities',
	#package : 'Moose-Core-Tests-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
MooseMSEImporterTestComment class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Comment super: #MooseMSEImporterTestSourcedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
]
