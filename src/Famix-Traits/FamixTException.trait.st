"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FamixTException is a normal FamixTClass.

## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `typeContainer` | `FamixTWithTypes` | `types` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|
| `methods` | `FamixTMethod` | `parentType` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingReferences` | `FamixTReference` | `referredType` | References to this entity by other entities.|
| `subInheritances` | `FamixTInheritance` | `superclass` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Type | Opposite | Comment |
| `catchingEntities` | `FamixTWithExceptions` | `caughtExceptions` | |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `declaringEntities` | `FamixTWithExceptions` | `declaredExceptions` | |
| `receivingInvocations` | `FamixTInvocation` | `receiver` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|
| `throwingEntities` | `FamixTWithExceptions` | `thrownExceptions` | |
| `typedEntities` | `FamixTTypedEntity` | `declaredType` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTException,
	#instVars : [
		'#catchingEntities => FMMany type: #FamixTWithExceptions opposite: #caughtExceptions',
		'#declaringEntities => FMMany type: #FamixTWithExceptions opposite: #declaredExceptions',
		'#throwingEntities => FMMany type: #FamixTWithExceptions opposite: #thrownExceptions'
	],
	#traits : 'FamixTClass',
	#classTraits : 'FamixTClass classTrait',
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTException classSide >> annotation [

	<FMClass: #TException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTException >> addCatchingEntity: anObject [
	<generated>
	^ self catchingEntities add: anObject
]

{ #category : #adding }
FamixTException >> addDeclaringEntity: anObject [
	<generated>
	^ self declaringEntities add: anObject
]

{ #category : #adding }
FamixTException >> addThrowingEntity: anObject [
	<generated>
	^ self throwingEntities add: anObject
]

{ #category : #accessing }
FamixTException >> catchingEntities [
	"Relation named: #catchingEntities type: #FamixTWithExceptions opposite: #caughtExceptions"

	<generated>
	<derived>
	^ catchingEntities
]

{ #category : #accessing }
FamixTException >> catchingEntities: anObject [

	<generated>
	catchingEntities value: anObject
]

{ #category : #accessing }
FamixTException >> declaringEntities [
	"Relation named: #declaringEntities type: #FamixTWithExceptions opposite: #declaredExceptions"

	<generated>
	<derived>
	^ declaringEntities
]

{ #category : #accessing }
FamixTException >> declaringEntities: anObject [

	<generated>
	declaringEntities value: anObject
]

{ #category : #testing }
FamixTException >> isException [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTException >> throwingEntities [
	"Relation named: #throwingEntities type: #FamixTWithExceptions opposite: #thrownExceptions"

	<generated>
	<derived>
	^ throwingEntities
]

{ #category : #accessing }
FamixTException >> throwingEntities: anObject [

	<generated>
	throwingEntities value: anObject
]
