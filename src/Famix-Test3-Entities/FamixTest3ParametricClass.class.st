"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretisations` | `FamixTParametricEntity` | `genericEntity` | `FamixTConcretisation` | concretisations relationships, i.e. known concreteEntities of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntity` | `FamixTParametricEntity` | `concreteEntity` | `FamixTConcretisation` | genericEntity relationships, i.e. known genericEntity of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concreteParameters` | `FamixTParametricEntity` | `concreteEntities` | `FamixTConcreteParameterType` | list of concreteParameters|
| `genericParameters` | `FamixTParametricEntity` | `genericEntities` | `FamixTGenericParameterType` | list of genericParameters|



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
