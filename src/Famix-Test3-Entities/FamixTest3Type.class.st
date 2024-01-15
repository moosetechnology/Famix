"
## Relations
======================

### Parents
- Relation: #typeContainer Type: #FamixTWithTypes Opposite: #types Comment: Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).
### Incomming dependencies
- Relation: #incomingReferences Type: #FamixTReference Opposite: #referredType Comment: References to this entity by other entities.
### Other
- Relation: #typedEntities Type: #FamixTTypedEntity Opposite: #declaredType Comment: Entities that have this type as declaredType
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Class {
	#name : #FamixTest3Type,
	#superclass : #FamixTest3NamedEntity,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Type class >> annotation [

	<FMClass: #Type super: #FamixTest3NamedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTest3Type class >> annotationFamixTest3TypeGroup [
	<generated>
	<mooseGroup>
	^ FamixTest3TypeGroup
]
