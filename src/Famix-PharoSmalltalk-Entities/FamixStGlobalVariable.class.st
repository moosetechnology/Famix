"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentScope` | `FamixTGlobalVariable` | `globalVariables` | `FamixTWithGlobalVariables` | Scope declaring the global variable. belongsTo implementation|

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
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixStGlobalVariable,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTGlobalVariable + FamixTInvocationsReceiver',
	#classTraits : 'FamixTGlobalVariable classTrait + FamixTInvocationsReceiver classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStGlobalVariable class >> annotation [

	<FMClass: #GlobalVariable super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]
