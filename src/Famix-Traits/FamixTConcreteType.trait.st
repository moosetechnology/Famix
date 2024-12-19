"
A type that can be the source of a concretization. Entities using this trait should also use TType.

## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTConcreteType` | `concreteParameter` | `FamixTConcretization` | Concretizations where the concrete parameter is this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntities` | `FamixTConcreteType` | `parameters` | `FamixTParametricEntity` | Generic entities for which a type parameter is this type.|



"
Trait {
	#name : #FamixTConcreteType,
	#instVars : [
		'#genericEntities => FMMany type: #FamixTParametricEntity opposite: #parameters',
		'#outgoingConcretizations => FMMany type: #FamixTConcretization opposite: #concreteParameter'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTConcreteType classSide >> annotation [

	<FMClass: #TConcreteType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTConcreteType >> addGenericEntity: anObject [
	<generated>
	^ self genericEntities add: anObject
]

{ #category : #adding }
FamixTConcreteType >> addOutgoingConcretization: anObject [
	<generated>
	^ self outgoingConcretizations add: anObject
]

{ #category : #accessing }
FamixTConcreteType >> genericEntities [
	"Relation named: #genericEntities type: #FamixTParametricEntity opposite: #parameters"

	<generated>
	<FMComment: 'Generic entities for which a type parameter is this type.'>
	^ genericEntities
]

{ #category : #accessing }
FamixTConcreteType >> genericEntities: anObject [

	<generated>
	genericEntities value: anObject
]

{ #category : #accessing }
FamixTConcreteType >> outgoingConcretizations [
	"Relation named: #outgoingConcretizations type: #FamixTConcretization opposite: #concreteParameter"

	<generated>
	<FMComment: 'Concretizations where the concrete parameter is this type.'>
	<derived>
	^ outgoingConcretizations
]

{ #category : #accessing }
FamixTConcreteType >> outgoingConcretizations: anObject [

	<generated>
	outgoingConcretizations value: anObject
]
