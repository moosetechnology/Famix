"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentPackage` | `FamixTPackage` | `childEntities` | Package containing the entity in the code structure (if applicable)|
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
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `receivingInvocations` | `FamixTInvocation` | `receiver` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTTypedEntity` | `declaredType` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixTest3Class,
	#superclass : #FamixTest3Type,
	#traits : 'FamixTClass + FamixTPackageable',
	#classTraits : 'FamixTClass classTrait + FamixTPackageable classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Class class >> annotation [

	<FMClass: #Class super: #FamixTest3Type>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTest3Class class >> annotationFamixTest3ClassGroup [
	<generated>
	<mooseGroup>
	^ FamixTest3ClassGroup
]
