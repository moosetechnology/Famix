"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentType` | `FamixTMethod` | `methods` | `FamixTWithMethods` | Type declaring the method. It provides the implementation for belongsTo.|

### Children
| Relation | Origin | Opposite | Type | Comment |
| `implicitVariables` | `FamixTWithImplicitVariables` | `parentBehaviouralEntity` | `FamixTImplicitVariable` | Implicit variables used locally by this behaviour.|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `declaredSourceLanguage` | `FamixTWithSourceLanguages` | `sourcedEntities` | `FamixTSourceLanguage` | The declared SourceLanguage for the source code of this entity|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isClassSide` | `Boolean` | nil | Entity can be declared class side i.e. static|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `kind` | `String` | nil | Tag indicating a setter, getter, constant, constructor method|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `signature` | `String` | nil | Signature of the message being sent|

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
