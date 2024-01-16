"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `element` | `FamixTSourceEntity` | `sourceAnchor` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : #FamixStSourceAnchor,
	#superclass : #FamixStEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixStSourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixStSourceAnchor
]
