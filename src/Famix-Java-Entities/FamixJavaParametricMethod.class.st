"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntity` | `FamixTTypeParameter` | The parameters of this parametric entity. They can be concrete classes or types or generic type parameters|



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
