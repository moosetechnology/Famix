"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixTestComposed1SourcedEntity',
	#superclass : 'FamixTestComposed1Entity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-TestComposedSubmetamodel1-Entities-Entities',
	#package : 'Famix-TestComposedSubmetamodel1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposed1SourcedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourcedEntity super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTestComposed1SourcedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTestComposed1SourcedEntity
]
