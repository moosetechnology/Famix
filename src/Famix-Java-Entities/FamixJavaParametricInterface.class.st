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
