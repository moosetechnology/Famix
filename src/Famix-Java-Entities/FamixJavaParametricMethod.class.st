"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntity` | `FamixTTypeParameter` | The type parameters of this parametric entity. They can any type with the exception of primitive types|



"
Class {
	#name : #FamixJavaParametricMethod,
	#superclass : #FamixJavaMethod,
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricMethod class >> annotation [

	<FMClass: #ParametricMethod super: #FamixJavaMethod>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
