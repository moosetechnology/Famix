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
