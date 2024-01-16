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
	#name : #FamixTest6SourcedEntity,
	#superclass : #FamixTest6Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest6SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest6SourcedEntity
]
