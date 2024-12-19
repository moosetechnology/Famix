"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FamixTParametricEntity` | `genericEntities` | `FamixTConcreteType` | The parameters of this parametric entity. They can be concrete classes or types or generic type parameters|



"
Class {
	#name : #FamixJavaParametricClass,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTParametricEntity',
	#classTraits : 'FamixTParametricEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricClass class >> annotation [

	<FMClass: #ParametricClass super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
