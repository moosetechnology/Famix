"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FamixTException is a normal FamixTClass.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
| `incomingReferences` | `FamixTReferenceable` | `referredType` | `FamixTReference` | References to this entity by other entities.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `catchingEntities` | `FamixTException` | `caughtExceptions` | `FamixTWithExceptions` | |
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `declaringEntities` | `FamixTException` | `declaredExceptions` | `FamixTWithExceptions` | |
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `throwingEntities` | `FamixTException` | `thrownExceptions` | `FamixTWithExceptions` | |
| `typedEntities` | `FamixTType` | `declaredType` | `FamixTTypedEntity` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

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
