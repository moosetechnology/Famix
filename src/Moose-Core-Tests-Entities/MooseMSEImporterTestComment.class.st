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
	#name : #MooseMSEImporterTestComment,
	#superclass : #MooseMSEImporterTestSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestComment class >> annotation [

	<FMClass: #Comment super: #MooseMSEImporterTestSourcedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
