"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixTest2SourcedEntity',
	#superclass : 'FamixTest2Entity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-Test2-Entities-Entities',
	#package : 'Famix-Test2-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest2SourcedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourcedEntity super: #FamixTest2Entity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest2SourcedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest2SourcedEntity
]
