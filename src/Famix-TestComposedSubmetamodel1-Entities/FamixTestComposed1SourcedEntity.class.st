"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixTestComposed1SourcedEntity,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTestComposed1SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed1SourcedEntity
]
