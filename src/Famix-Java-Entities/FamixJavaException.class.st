"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `typeContainer` | `FamixTWithTypes` | `types` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|
| `methods` | `FamixTMethod` | `parentType` | Methods declared by this type.|
| `types` | `FamixTType` | `typeContainer` | Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `interfaceImplementations` | `FamixTImplementation` | `implementingClass` | Implementation relationships|
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingReferences` | `FamixTReference` | `referredType` | References to this entity by other entities.|
| `subInheritances` | `FamixTInheritance` | `superclass` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Type | Opposite | Comment |
| `annotationInstances` | `FamixTAnnotationInstance` | `annotatedEntity` | This property corresponds to the set of annotations associated to the entity|
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
| `visibility` | String | Visibility of the entity|

"
Class {
	#name : #FamixJavaException,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTCanImplement + FamixTException + FamixTHasVisibility + FamixTWithAnnotationInstances + FamixTWithTypes',
	#classTraits : 'FamixTCanImplement classTrait + FamixTException classTrait + FamixTHasVisibility classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaException class >> annotation [

	<FMClass: #Exception super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
