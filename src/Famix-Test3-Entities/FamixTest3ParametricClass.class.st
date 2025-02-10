"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntities` | `FamixTConcreteType` | The parameters of this parametric entity. They can be concrete classes or types or generic type parameters|



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
