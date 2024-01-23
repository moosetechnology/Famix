"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|


## Properties
======================

| Name | Type | Default value | Comment |
| `content` | `String` | nil | Content of the comment as a String|

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
