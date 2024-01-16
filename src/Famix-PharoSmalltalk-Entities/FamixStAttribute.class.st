"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentType` | `FamixTAttribute` | `attributes` | `FamixTWithAttributes` | Type declaring the attribute. belongsTo implementation|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixStAttribute,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTAttribute + FamixTCanBeClassSide + FamixTInvocationsReceiver',
	#classTraits : 'FamixTAttribute classTrait + FamixTCanBeClassSide classTrait + FamixTInvocationsReceiver classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> beSharedVariable [

	self propertyNamed: #sharedVariable put: true 
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> isSharedVariable [
	^ self propertyNamed: #sharedVariable ifNil: [ false ]
]
