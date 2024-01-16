"
## Relations
======================

### Other
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Class {
	#name : #FamixTestComposed2SourcedEntity,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTestComposed2SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed2SourcedEntity
]
