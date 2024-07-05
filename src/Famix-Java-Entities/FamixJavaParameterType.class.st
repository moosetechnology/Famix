"
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
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredType` | `FamixTReference` | References to this entity by other entities.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchingEntities` | `FamixTThrowable` | `caughtExceptions` | `FamixTWithExceptions` | |
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `declaringEntities` | `FamixTThrowable` | `declaredExceptions` | `FamixTWithExceptions` | |
| `genericEntities` | `FamixTGenericParameterType` | `genericParameters` | `FamixTParametricEntity` | The generic entities that use me.|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `throwingEntities` | `FamixTThrowable` | `thrownExceptions` | `FamixTWithExceptions` | |
| `typedEntities` | `FamixTType` | `declaredType` | `FamixTTypedEntity` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaParameterType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTGenericParameterType + FamixTThrowable + FamixTTypedEntity + FamixTWithInheritances',
	#classTraits : 'FamixTGenericParameterType classTrait + FamixTThrowable classTrait + FamixTTypedEntity classTrait + FamixTWithInheritances classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterType class >> annotation [

	<FMClass: #ParameterType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixJavaParameterType >> isParameterType [
	^ true
]
