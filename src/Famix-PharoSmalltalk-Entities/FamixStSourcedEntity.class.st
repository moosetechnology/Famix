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
	#name : #FamixStSourcedEntity,
	#superclass : #FamixStEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixStSourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixStSourcedEntity
]
