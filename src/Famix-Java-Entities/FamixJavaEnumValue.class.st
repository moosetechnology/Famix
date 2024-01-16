"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentEnum` | `FamixTWithEnumValues` | `enumValues` | The Enum declaring this value. It offers the implementation of belongsTo|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingAccesses` | `FamixTAccess` | `variable` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Type | Opposite | Comment |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaEnumValue,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTEnumValue + FamixTWithComments',
	#classTraits : 'FamixTEnumValue classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnumValue class >> annotation [

	<FMClass: #EnumValue super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
