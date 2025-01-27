"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FamixTException is a normal FamixTClass.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingDeclarations` | `FamixTType` | `declaredType` | `FamixTTypeDeclaration` | Relations to the entities that have this as type.|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchingEntities` | `FamixTThrowable` | `caughtExceptions` | `FamixTWithExceptions` | |
| `declaringEntities` | `FamixTThrowable` | `declaredExceptions` | `FamixTWithExceptions` | |
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `throwingEntities` | `FamixTThrowable` | `thrownExceptions` | `FamixTWithExceptions` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTException,
	#traits : 'FamixTClass + FamixTThrowable',
	#classTraits : 'FamixTClass classTrait + FamixTThrowable classTrait',
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTException classSide >> annotation [

	<FMClass: #TException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #testing }
FamixTException >> isException [

	<generated>
	^ true
]
