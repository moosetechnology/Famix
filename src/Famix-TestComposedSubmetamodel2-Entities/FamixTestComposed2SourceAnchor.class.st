"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : #FamixTestComposed2SourceAnchor,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTestComposed2SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixTestComposed2SourceAnchor
]
