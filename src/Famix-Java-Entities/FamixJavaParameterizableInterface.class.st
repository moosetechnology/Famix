"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `parameterizedTypes` | `FamixTWithParameterizedTypes` | `parameterizableClass` | `FamixTParameterizedType` | |



"
Class {
	#name : #FamixJavaParameterizableInterface,
	#superclass : #FamixJavaInterface,
	#traits : 'FamixTWithParameterizedTypes',
	#classTraits : 'FamixTWithParameterizedTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterizableInterface class >> annotation [

	<FMClass: #ParameterizableInterface super: #FamixJavaInterface>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
