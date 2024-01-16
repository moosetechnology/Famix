"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `element` | `FamixTSourceEntity` | `sourceAnchor` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : #FamixTest6SourceAnchor,
	#superclass : #FamixTest6Entity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest6SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixTest6SourceAnchor
]
