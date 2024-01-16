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
	#name : #FamixTestComposed1Comment,
	#superclass : #FamixTestComposed1SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Comment class >> annotation [

	<FMClass: #Comment super: #FamixTestComposed1SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^ self
]
