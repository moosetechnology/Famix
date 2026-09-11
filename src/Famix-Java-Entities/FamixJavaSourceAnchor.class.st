"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FamixJavaSourceAnchor',
	#superclass : 'FamixJavaEntity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaSourceAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceAnchor super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixJavaSourceAnchor class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixJavaSourceAnchor
]
