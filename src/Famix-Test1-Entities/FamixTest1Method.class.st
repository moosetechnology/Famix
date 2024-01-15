"
## Relations
======================

### Parents
- Relation: #parentType Type: #FamixTWithMethods Opposite: #methods Comment: Type declaring the method. It provides the implementation for belongsTo.
### Children
- Relation: #implicitVariables Type: #FamixTImplicitVariable Opposite: #parentBehaviouralEntity Comment: Implicit variables used locally by this behaviour.
- Relation: #parameters Type: #FamixTParameter Opposite: #parentBehaviouralEntity Comment: List of formal parameters declared by this behaviour.
- Relation: #localVariables Type: #FamixTLocalVariable Opposite: #parentBehaviouralEntity Comment: Variables locally defined by this behaviour.
### Outgoing dependencies
- Relation: #outgoingReferences Type: #FamixTReference Opposite: #referencer Comment: References from this entity to other entities.
- Relation: #accesses Type: #FamixTAccess Opposite: #accessor Comment: Accesses to variables made by this behaviour.
- Relation: #outgoingInvocations Type: #FamixTInvocation Opposite: #sender Comment: Outgoing invocations sent by this behaviour.
### Incomming dependencies
- Relation: #incomingInvocations Type: #FamixTInvocation Opposite: #candidates Comment: Incoming invocations from other behaviours computed by the candidate operator.
### Other
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #declaredSourceLanguage Type: #FamixTSourceLanguage Opposite: #sourcedEntities Comment: The declared SourceLanguage for the source code of this entity
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #name Type: String Comment: Basic name of the entity, not full reference.
- Named: #signature Type: String Comment: Signature of the message being sent
- Named: #kind Type: String Comment: Tag indicating a setter, getter, constant, constructor method
- Named: #isClassSide Type: Boolean Comment: Entity can be declared class side i.e. static
- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Class {
	#name : #FamixTest1Method,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTHasKind + FamixTMethod + FamixTWithComments + FamixTWithSourceLanguages + FamixTest1TCanBeClassSide',
	#classTraits : 'FamixTHasKind classTrait + FamixTMethod classTrait + FamixTWithComments classTrait + FamixTWithSourceLanguages classTrait + FamixTest1TCanBeClassSide classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Method class >> annotation [

	<FMClass: #Method super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
