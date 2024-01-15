"
This a comment for the Class entity

## Relations
======================

### Parents
- Relation: #typeContainer Type: #FamixTWithTypes Opposite: #types Comment: Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).
- Relation: #parentPackage Type: #FamixTPackage Opposite: #childEntities Comment: Package containing the entity in the code structure (if applicable)
### Children
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
- Relation: #methods Type: #FamixTMethod Opposite: #parentType Comment: Methods declared by this type.
### Outgoing dependencies
- Relation: #superInheritances Type: #FamixTInheritance Opposite: #subclass Comment: Superinheritance relationships, i.e. known superclasses of this type.
### Incomming dependencies
- Relation: #subInheritances Type: #FamixTInheritance Opposite: #superclass Comment: Subinheritance relationships, i.e. known subclasses of this type.
- Relation: #incomingReferences Type: #FamixTReference Opposite: #referredType Comment: References to this entity by other entities.
### Other
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #declaredSourceLanguage Type: #FamixTSourceLanguage Opposite: #sourcedEntities Comment: The declared SourceLanguage for the source code of this entity
- Relation: #typedEntities Type: #FamixTTypedEntity Opposite: #declaredType Comment: Entities that have this type as declaredType
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Class {
	#name : #FamixTest1Class,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTClass + FamixTPackageable + FamixTSourceEntity + FamixTWithComments + FamixTWithSourceLanguages',
	#classTraits : 'FamixTClass classTrait + FamixTPackageable classTrait + FamixTSourceEntity classTrait + FamixTWithComments classTrait + FamixTWithSourceLanguages classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Class class >> annotation [

	<FMClass: #Class super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
