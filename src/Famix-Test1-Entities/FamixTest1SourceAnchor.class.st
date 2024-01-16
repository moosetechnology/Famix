"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : #FamixTest1SourceAnchor,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest1SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixTest1SourceAnchor
]
