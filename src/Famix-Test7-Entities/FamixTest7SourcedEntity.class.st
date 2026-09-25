"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixTest7SourcedEntity',
	#superclass : 'FamixTest7Entity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-Test7-Entities-Entities',
	#package : 'Famix-Test7-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest7SourcedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourcedEntity super: #FamixTest7Entity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest7SourcedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest7SourcedEntity
]
