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
| `concretizations` | `FamixTGenericParameterType` | `genericParameter` | `FamixTParameterConcretization` | Concretization relationships, i.e. known concretizations of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntities` | `FamixTGenericParameterType` | `genericParameters` | `FamixTParametricEntity` | The generic entities that use me.|
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
		'#concretizations => FMMany type: #FamixTParameterConcretization opposite: #genericParameter',
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

{ #category : #visitor }
FamixTGenericParameterType >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTGenericParameterType: self
]

{ #category : #adding }
FamixTGenericParameterType >> addConcretization: anObject [
	<generated>
	^ self concretizations add: anObject
]

{ #category : #adding }
FamixTGenericParameterType >> addGenericEntity: anObject [
	<generated>
	^ self genericEntities add: anObject
]

{ #category : #accessing }
FamixTGenericParameterType >> concretizations [
	"Relation named: #concretizations type: #FamixTParameterConcretization opposite: #genericParameter"

	<generated>
	<FMComment: 'Concretization relationships, i.e. known concretizations of this type.'>
	<derived>
	^ concretizations
]

{ #category : #accessing }
FamixTGenericParameterType >> concretizations: anObject [

	<generated>
	concretizations value: anObject
]

{ #category : #accessing }
FamixTGenericParameterType >> genericEntities [
	"Relation named: #genericEntities type: #FamixTParametricEntity opposite: #genericParameters"

	<generated>
	<FMComment: 'The generic entities that use me.'>
	<derived>
	^ genericEntities
]

{ #category : #accessing }
FamixTGenericParameterType >> genericEntities: anObject [

	<generated>
	genericEntities value: anObject
]
