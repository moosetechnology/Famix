"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FamixTest3SourceAnchor',
	#superclass : 'FamixTest3Entity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3SourceAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceAnchor super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest3SourceAnchor class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest3SourceAnchor
]
