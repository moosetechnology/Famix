"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentType` | `FamixTWithMethods` | `methods` | Type declaring the method. It provides the implementation for belongsTo.|

### Children
| Relation | Type | Opposite | Comment |
| `implicitVariables` | `FamixTImplicitVariable` | `parentBehaviouralEntity` | Implicit variables used locally by this behaviour.|
| `localVariables` | `FamixTLocalVariable` | `parentBehaviouralEntity` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTParameter` | `parentBehaviouralEntity` | List of formal parameters declared by this behaviour.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `accesses` | `FamixTAccess` | `accessor` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTInvocation` | `sender` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTReference` | `referencer` | References from this entity to other entities.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingInvocations` | `FamixTInvocation` | `candidates` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Type | Opposite | Comment |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `declaredSourceLanguage` | `FamixTSourceLanguage` | `sourcedEntities` | The declared SourceLanguage for the source code of this entity|
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isClassSide` | Boolean | Entity can be declared class side i.e. static|
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `kind` | String | Tag indicating a setter, getter, constant, constructor method|
| `name` | String | Basic name of the entity, not full reference.|
| `signature` | String | Signature of the message being sent|

"
Class {
	#name : #FamixTest1Method,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTHasKind + FamixTMethod + FamixTWithComments + FamixTWithSourceLanguages + FamixTest1TCanBeClassSide',
	#classTraits : 'FamixTHasKind classTrait + FamixTMethod classTrait + FamixTWithComments classTrait + FamixTWithSourceLanguages classTrait + FamixTest1TCanBeClassSide classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Method class >> annotation [

	<FMClass: #Method super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
