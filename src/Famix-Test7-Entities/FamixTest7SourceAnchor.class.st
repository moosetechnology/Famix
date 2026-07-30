"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FamixTest7SourceAnchor',
	#superclass : 'FamixTest7Entity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'Famix-Test7-Entities-Entities',
	#package : 'Famix-Test7-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest7SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixTest7Entity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest7SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixTest7SourceAnchor
]
