"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentEnum` | `FamixTEnumValue` | `enumValues` | `FamixTWithEnumValues` | The Enum declaring this value. It offers the implementation of belongsTo|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

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
