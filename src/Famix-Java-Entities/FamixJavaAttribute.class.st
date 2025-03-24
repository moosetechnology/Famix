"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentType` | `FamixTAttribute` | `attributes` | `FamixTWithAttributes` | Type declaring the attribute. belongsTo implementation|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|
| `isFinal` | `Boolean` | false | Entity can be declared final|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `isTransient` | `Boolean` | false | Entity can be declared transient|
| `isVolatile` | `Boolean` | false | Entity can be declared volatile|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `visibility` | `String` | nil | Visibility of the entity|

"
Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaVariable,
	#traits : 'FamixJavaTCanBeTransient + FamixJavaTCanBeVolatile + FamixTAttribute + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTWithComments',
	#classTraits : 'FamixJavaTCanBeTransient classTrait + FamixJavaTCanBeVolatile classTrait + FamixTAttribute classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaVariable>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
