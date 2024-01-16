"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentType` | `FamixTWithAttributes` | `attributes` | Type declaring the attribute. belongsTo implementation|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingAccesses` | `FamixTAccess` | `variable` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Type | Opposite | Comment |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `receivingInvocations` | `FamixTInvocation` | `receiver` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isClassSide` | Boolean | Entity can be declared class side i.e. static|
| `isFinal` | Boolean | Entity can be declared final|
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `isTransient` | Boolean | Entity can be declared transient|
| `isVolatile` | Boolean | Entity can be declared volatile|
| `name` | String | Basic name of the entity, not full reference.|
| `visibility` | String | Visibility of the entity|

"
Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTCanBeTransient + FamixJavaTCanBeVolatile + FamixTAttribute + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTInvocationsReceiver + FamixTWithComments',
	#classTraits : 'FamixJavaTCanBeTransient classTrait + FamixJavaTCanBeVolatile classTrait + FamixTAttribute classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTInvocationsReceiver classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
