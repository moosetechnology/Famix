"
## Relations
======================

### Other
- Relation: #declaredSourceLanguage Type: #FamixTSourceLanguage Opposite: #sourcedEntities Comment: The declared SourceLanguage for the source code of this entity
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #containerFiles Type: #FamixTFile Opposite: #entities Comment: List of files containing the entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Class {
	#name : #FamixTest1SourcedEntity,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTSourceEntity + FamixTWithFiles + FamixTWithSourceLanguages',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithFiles classTrait + FamixTWithSourceLanguages classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest1SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest1SourcedEntity
]
