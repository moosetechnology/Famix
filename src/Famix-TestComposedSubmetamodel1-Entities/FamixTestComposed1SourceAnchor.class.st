"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FamixTestComposed1SourceAnchor',
	#superclass : 'FamixTestComposed1Entity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'Famix-TestComposedSubmetamodel1-Entities-Entities',
	#package : 'Famix-TestComposedSubmetamodel1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposed1SourceAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceAnchor super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTestComposed1SourceAnchor class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTestComposed1SourceAnchor
]
