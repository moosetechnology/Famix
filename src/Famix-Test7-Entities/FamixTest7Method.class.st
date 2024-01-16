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
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|
| `signature` | String | Signature of the message being sent|

"
Class {
	#name : #FamixTest7Method,
	#superclass : #FamixTest7Entity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7Method class >> annotation [

	<FMClass: #Method super: #FamixTest7Entity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]
