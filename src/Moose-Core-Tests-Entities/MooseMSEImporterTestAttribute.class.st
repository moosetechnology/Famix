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
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Class {
	#name : #MooseMSEImporterTestAttribute,
	#superclass : #MooseMSEImporterTestNamedEntity,
	#traits : 'FamixTAttribute + FamixTSourceEntity',
	#classTraits : 'FamixTAttribute classTrait + FamixTSourceEntity classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestAttribute class >> annotation [

	<FMClass: #Attribute super: #MooseMSEImporterTestNamedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
