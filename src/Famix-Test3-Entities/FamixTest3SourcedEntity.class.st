"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : #FamixTest3SourcedEntity,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest3SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest3SourcedEntity
]
