"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntity` | `FamixTTypeParameter` | The type parameters of this parametric entity. They can any type with the exception of primitive types|



"
Class {
	#name : 'FamixJavaParametricClass',
	#superclass : 'FamixJavaClass',
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaParametricClass class >> annotation [

	<FMClass: #ParametricClass super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'visitor' }
FamixJavaParametricClass >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaParametricClass: self
]
