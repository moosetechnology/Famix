"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntities` | `FamixTConcreteType` | The parameters of this parametric entity. They can be concrete classes or types or generic type parameters|



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
