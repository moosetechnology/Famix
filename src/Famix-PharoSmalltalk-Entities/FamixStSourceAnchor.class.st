"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FamixStSourceAnchor',
	#superclass : 'FamixStEntity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'Famix-PharoSmalltalk-Entities-Entities',
	#package : 'Famix-PharoSmalltalk-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixStSourceAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceAnchor super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixStSourceAnchor class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixStSourceAnchor
]
