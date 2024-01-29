"
FamixTGenericParameterType represents generic parameters in an FamixJavaParametricEntity. This is an FamixJavaParameterType

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretisations` | `FamixTGenericParameterType` | `genericParameter` | `FamixTParameterConcretisation` | concretisations relationships, i.e. known concretisation of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredType` | `FamixTReference` | References to this entity by other entities.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntities` | `FamixTGenericParameterType` | `genericParameters` | `FamixTParametricEntity` | genericEntity of a parameter|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTType` | `declaredType` | `FamixTTypedEntity` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTGenericParameterType,
	#instVars : [
		'#concretisations => FMMany type: #FamixTParameterConcretisation opposite: #genericParameter',
		'#genericEntities => FMMany type: #FamixTParametricEntity opposite: #genericParameters'
	],
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTGenericParameterType classSide >> annotation [

	<FMClass: #TGenericParameterType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTGenericParameterType >> addConcretisation: anObject [
	<generated>
	^ self concretisations add: anObject
]

{ #category : #adding }
FamixTGenericParameterType >> addGenericEntity: anObject [
	<generated>
	^ self genericEntities add: anObject
]

{ #category : #accessing }
FamixTGenericParameterType >> concretisations [
	"Relation named: #concretisations type: #FamixTParameterConcretisation opposite: #genericParameter"

	<generated>
	<FMComment: 'concretisations relationships, i.e. known concretisation of this type.'>
	<derived>
	^ concretisations
]

{ #category : #accessing }
FamixTGenericParameterType >> concretisations: anObject [

	<generated>
	concretisations value: anObject
]

{ #category : #accessing }
FamixTGenericParameterType >> genericEntities [
	"Relation named: #genericEntities type: #FamixTParametricEntity opposite: #genericParameters"

	<generated>
	<FMComment: 'genericEntity of a parameter'>
	<derived>
	^ genericEntities
]

{ #category : #accessing }
FamixTGenericParameterType >> genericEntities: anObject [

	<generated>
	genericEntities value: anObject
]
