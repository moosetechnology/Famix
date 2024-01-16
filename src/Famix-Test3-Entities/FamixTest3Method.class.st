"
## Relations
======================

### Parents
- Relation: #parentType Type: #FamixTWithMethods Opposite: #methods Comment: Type declaring the method. It provides the implementation for belongsTo.
### Children
- Relation: #implicitVariables Type: #FamixTImplicitVariable Opposite: #parentBehaviouralEntity Comment: Implicit variables used locally by this behaviour.
- Relation: #localVariables Type: #FamixTLocalVariable Opposite: #parentBehaviouralEntity Comment: Variables locally defined by this behaviour.
- Relation: #parameters Type: #FamixTParameter Opposite: #parentBehaviouralEntity Comment: List of formal parameters declared by this behaviour.
### Outgoing dependencies
- Relation: #accesses Type: #FamixTAccess Opposite: #accessor Comment: Accesses to variables made by this behaviour.
- Relation: #outgoingInvocations Type: #FamixTInvocation Opposite: #sender Comment: Outgoing invocations sent by this behaviour.
- Relation: #outgoingReferences Type: #FamixTReference Opposite: #referencer Comment: References from this entity to other entities.
### Incoming dependencies
- Relation: #incomingInvocations Type: #FamixTInvocation Opposite: #candidates Comment: Incoming invocations from other behaviours computed by the candidate operator.
### Other
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.
- Named: #signature Type: String Comment: Signature of the message being sent

"
Class {
	#name : #FamixTest3Method,
	#superclass : #FamixTest3NamedEntity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Method class >> annotation [

	<FMClass: #Method super: #FamixTest3NamedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
