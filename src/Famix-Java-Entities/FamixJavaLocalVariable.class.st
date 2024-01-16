"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentBehaviouralEntity` | `FamixTWithLocalVariables` | `localVariables` | Behavioural entity declaring this local variable. belongsTo implementation|

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
| `isFinal` | Boolean | Entity can be declared final|
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaLocalVariable,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTCanBeFinal + FamixTInvocationsReceiver + FamixTLocalVariable + FamixTWithComments',
	#classTraits : 'FamixTCanBeFinal classTrait + FamixTInvocationsReceiver classTrait + FamixTLocalVariable classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaLocalVariable class >> annotation [

	<FMClass: #LocalVariable super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #printing }
FamixJavaLocalVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #printing }
FamixJavaLocalVariable >> printOn: stream [ 
	| parent |
	self name ifNotNil: [ stream nextPutAll: self name ].
	stream nextPutAll: ' (local variable'.
	parent := self parentBehaviouralEntity.
	parent ifNotNil: [
		stream nextPutAll: ' in '.
		parent printOn: stream ].
	stream nextPut: $)

]
