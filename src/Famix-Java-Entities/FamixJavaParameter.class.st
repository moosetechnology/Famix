"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentBehaviouralEntity` | `FamixTParameter` | `parameters` | `FamixTWithParameters` | Behavioural entity containing this parameter. belongsTo implementation|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isFinal` | `Boolean` | false | Entity can be declared final|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaParameter,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTCanBeFinal + FamixTParameter + FamixTWithComments',
	#classTraits : 'FamixTCanBeFinal classTrait + FamixTParameter classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameter class >> annotation [

	<FMClass: #Parameter super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #printing }
FamixJavaParameter >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #accessing }
FamixJavaParameter >> parentType [
	^self parentBehaviouralEntity parentType
]

{ #category : #printing }
FamixJavaParameter >> printOn: stream [ 
	| parent |
	self name ifNotNil: [ stream nextPutAll: self name ].
	stream nextPutAll: ' (parameter'.
	parent := self parentBehaviouralEntity.
	parent ifNotNil: [
		stream nextPutAll: ' in '.
		parent printOn: stream ].
	stream nextPut: $)

]
