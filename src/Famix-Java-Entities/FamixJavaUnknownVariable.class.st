"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaUnknownVariable,
	#superclass : #FamixJavaVariable,
	#traits : 'FamixTUnknownVariable',
	#classTraits : 'FamixTUnknownVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownVariable class >> annotation [

	<FMClass: #UnknownVariable super: #FamixJavaVariable>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixJavaUnknownVariable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaUnknownVariable: self
]
