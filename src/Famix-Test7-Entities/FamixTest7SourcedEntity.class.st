"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : #FamixTest7SourcedEntity,
	#superclass : #FamixTest7Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest7Entity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest7SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest7SourcedEntity
]
