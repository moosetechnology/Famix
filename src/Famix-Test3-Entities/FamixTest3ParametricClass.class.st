"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntity` | `FamixTTypeParameter` | The type parameters of this parametric entity. They can any type with the exception of primitive types|



"
Class {
	#name : #FamixTest3ParametricClass,
	#superclass : #FamixTest3Class,
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3ParametricClass class >> annotation [

	<FMClass: #ParametricClass super: #FamixTest3Class>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
