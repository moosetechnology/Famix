"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

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
