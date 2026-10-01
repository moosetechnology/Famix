"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntity` | `FamixTTypeParameter` | The type parameters of this parametric entity. They can any type with the exception of primitive types|



"
Class {
	#name : 'FamixTest2ParametricClass',
	#superclass : 'FamixTest2Class',
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : 'Famix-Test2-Entities-Entities',
	#package : 'Famix-Test2-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest2ParametricClass class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ParametricClass super: #FamixTest2Class>
	<package: #'Famix-Test2-Entities'>
	<generated>
]
