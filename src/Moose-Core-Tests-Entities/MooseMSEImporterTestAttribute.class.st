"
## Relations
======================

### Parents
- Relation: #parentType Type: #FamixTWithAttributes Opposite: #attributes Comment: Type declaring the attribute. belongsTo implementation
### Incomming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

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
