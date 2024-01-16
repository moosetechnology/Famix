"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `parameterizedTypes` | `FamixTParameterizedType` | `parameterizableClass` | |



"
Class {
	#name : #FamixJavaParameterizableException,
	#superclass : #FamixJavaException,
	#traits : 'FamixTWithParameterizedTypes',
	#classTraits : 'FamixTWithParameterizedTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterizableException class >> annotation [

	<FMClass: #ParameterizableException super: #FamixJavaException>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
