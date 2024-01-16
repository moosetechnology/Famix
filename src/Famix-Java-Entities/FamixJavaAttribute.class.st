"
## Relations
======================

### Parents
- Relation: #parentType Type: #FamixTWithAttributes Opposite: #attributes Comment: Type declaring the attribute. belongsTo implementation
### Incoming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isClassSide Type: Boolean Comment: Entity can be declared class side i.e. static
- Named: #isFinal Type: Boolean Comment: Entity can be declared final
- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #isTransient Type: Boolean Comment: Entity can be declared transient
- Named: #isVolatile Type: Boolean Comment: Entity can be declared volatile
- Named: #name Type: String Comment: Basic name of the entity, not full reference.
- Named: #visibility Type: String Comment: Visibility of the entity

"
Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTCanBeTransient + FamixJavaTCanBeVolatile + FamixTAttribute + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTInvocationsReceiver + FamixTWithComments',
	#classTraits : 'FamixJavaTCanBeTransient classTrait + FamixJavaTCanBeVolatile classTrait + FamixTAttribute classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTInvocationsReceiver classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
