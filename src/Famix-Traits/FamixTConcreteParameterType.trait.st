"
FamixTConcreteParameterType represents the concretePamameters of an FamixTParametricEntity. it can be a class or a ParameterType that has one FamixTParameterConcretization

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
| `generics` | `FamixTConcreteParameterType` | `concreteParameter` | `FamixTParameterConcretisation` | generic relationships, i.e. known genericParameter of this type.|
| `incomingReferences` | `FamixTReferenceable` | `referredType` | `FamixTReference` | References to this entity by other entities.|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `concreteEntities` | `FamixTConcreteParameterType` | `concreteParameters` | `FamixTParametricEntity` | concreteEntity of a parameter|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTType` | `declaredType` | `FamixTTypedEntity` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTConcreteParameterType,
	#instVars : [
		'#concreteEntities => FMMany type: #FamixTParametricEntity opposite: #concreteParameters',
		'#generics => FMMany type: #FamixTParameterConcretisation opposite: #concreteParameter'
	],
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTConcreteParameterType classSide >> annotation [

	<FMClass: #TConcreteParameterType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTConcreteParameterType >> addConcreteEntity: anObject [
	<generated>
	^ self concreteEntities add: anObject
]

{ #category : #adding }
FamixTConcreteParameterType >> addGeneric: anObject [
	<generated>
	^ self generics add: anObject
]

{ #category : #accessing }
FamixTConcreteParameterType >> concreteEntities [
	"Relation named: #concreteEntities type: #FamixTParametricEntity opposite: #concreteParameters"

	<generated>
	<FMComment: 'concreteEntity of a parameter'>
	<derived>
	^ concreteEntities
]

{ #category : #accessing }
FamixTConcreteParameterType >> concreteEntities: anObject [

	<generated>
	concreteEntities value: anObject
]

{ #category : #accessing }
FamixTConcreteParameterType >> generics [
	"Relation named: #generics type: #FamixTParameterConcretisation opposite: #concreteParameter"

	<generated>
	<FMComment: 'generic relationships, i.e. known genericParameter of this type.'>
	<derived>
	^ generics
]

{ #category : #accessing }
FamixTConcreteParameterType >> generics: anObject [

	<generated>
	generics value: anObject
]
