"
## Relations
======================

### Other
- Relation: #commentedEntity Type: #FamixTWithComments Opposite: #comments Comment: Source code commented by the comment

## Properties
======================

- Named: #content Type: String Comment: Content of the comment as a String

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
