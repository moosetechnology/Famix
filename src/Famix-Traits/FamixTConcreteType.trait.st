"
A type that can be the source of a concretization. Entities using this trait should also use TType.

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTConcreteType` | `concreteParameter` | `FamixTConcretization` | Concretizations where this type is the concrete parameter.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntities` | `FamixTConcreteType` | `typeParameters` | `FamixTParametricEntity` | Generic entities that have this type as type parameter.|



"
Trait {
	#name : #FamixTConcreteType,
	#instVars : [
		'#genericEntities => FMMany type: #FamixTParametricEntity opposite: #typeParameters',
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
	"Relation named: #genericEntities type: #FamixTParametricEntity opposite: #typeParameters"

	<generated>
	<FMComment: 'Generic entities that have this type as type parameter.'>
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
	<FMComment: 'Concretizations where this type is the concrete parameter.'>
	<derived>
	^ outgoingConcretizations
]

{ #category : #accessing }
FamixTConcreteType >> outgoingConcretizations: anObject [

	<generated>
	outgoingConcretizations value: anObject
]
