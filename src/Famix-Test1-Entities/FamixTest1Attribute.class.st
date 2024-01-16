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
| `declaredSourceLanguage` | `FamixTSourceLanguage` | `sourcedEntities` | The declared SourceLanguage for the source code of this entity|
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isClassSide` | Boolean | Entity can be declared class side i.e. static|
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixTest1Attribute,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTAttribute + FamixTSourceEntity + FamixTWithSourceLanguages + FamixTest1TCanBeClassSide',
	#classTraits : 'FamixTAttribute classTrait + FamixTSourceEntity classTrait + FamixTWithSourceLanguages classTrait + FamixTest1TCanBeClassSide classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Attribute class >> annotation [

	<FMClass: #Attribute super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
