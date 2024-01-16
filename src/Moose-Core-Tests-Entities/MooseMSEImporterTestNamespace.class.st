"
## Relations
======================

### Children
| Relation | Type | Opposite | Comment |
| `types` | `FamixTType` | `typeContainer` | Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|

### Other
| Relation | Type | Opposite | Comment |
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Class {
	#name : #MooseMSEImporterTestNamespace,
	#superclass : #MooseMSEImporterTestNamedEntity,
	#traits : 'FamixTNamespace + FamixTWithClasses',
	#classTraits : 'FamixTNamespace classTrait + FamixTWithClasses classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestNamespace class >> annotation [

	<FMClass: #Namespace super: #MooseMSEImporterTestNamedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
