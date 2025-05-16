"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntity` | `FamixTTypeParameter` | The type parameters of this parametric entity. They can any type with the exception of primitive types|



"
Class {
	#name : #FamixJavaParametricInterface,
	#superclass : #FamixJavaInterface,
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricInterface class >> annotation [

	<FMClass: #ParametricInterface super: #FamixJavaInterface>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixJavaParametricInterface >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaParametricInterface: self
]
