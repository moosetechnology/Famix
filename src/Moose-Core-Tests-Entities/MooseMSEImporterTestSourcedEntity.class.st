"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #MooseMSEImporterTestSourcedEntity,
	#superclass : #MooseMSEImporterTestEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #MooseMSEImporterTestEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
MooseMSEImporterTestSourcedEntity class >> isAbstract [

	<generated>
	^ self == MooseMSEImporterTestSourcedEntity
]
