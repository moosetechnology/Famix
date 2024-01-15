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
	#name : #FamixTest7Comment,
	#superclass : #FamixTest7SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7Comment class >> annotation [

	<FMClass: #Comment super: #FamixTest7SourcedEntity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]
