"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `typeContainer` | `FamixTWithTypes` | `types` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|
| `enumValues` | `FamixTEnumValue` | `parentEnum` | |
| `methods` | `FamixTMethod` | `parentType` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `outgoingImports` | `FamixTImport` | `importingEntity` | |
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingImports` | `FamixTImport` | `importedEntity` | List of imports of this entity|
| `incomingReferences` | `FamixTReference` | `referredType` | References to this entity by other entities.|
| `subInheritances` | `FamixTInheritance` | `superclass` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Type | Opposite | Comment |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTTypedEntity` | `declaredType` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|
| `visibility` | String | Visibility of the entity|

"
Class {
	#name : #FamixJavaEnum,
	#superclass : #FamixJavaType,
	#traits : 'FamixTEnum + FamixTHasVisibility + FamixTImportable + FamixTWithAttributes + FamixTWithComments + FamixTWithImports + FamixTWithInheritances + FamixTWithMethods',
	#classTraits : 'FamixTEnum classTrait + FamixTHasVisibility classTrait + FamixTImportable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithImports classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnum class >> annotation [

	<FMClass: #Enum super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaEnum >> values [
	^ self enumValues
]

{ #category : #accessing }
FamixJavaEnum >> values: anObject [
	self enumValues: anObject
]
