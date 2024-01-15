"
## Relations
======================

### Parents
- Relation: #parentBehaviouralEntity Type: #FamixTWithImplicitVariables Opposite: #implicitVariables Comment: The behaviour containing this implicit variable. belongsTo implementation
### Incomming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any

## Properties
======================

- Named: #name Type: String Comment: Basic name of the entity, not full reference.
- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Class {
	#name : #FamixStImplicitVariable,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTImplicitVariable + FamixTInvocationsReceiver',
	#classTraits : 'FamixTImplicitVariable classTrait + FamixTInvocationsReceiver classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStImplicitVariable class >> annotation [

	<FMClass: #ImplicitVariable super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixStImplicitVariable >> isSelf [
	^ self name = #self
]

{ #category : #testing }
FamixStImplicitVariable >> isSuper [
	^ self name == #super
]

{ #category : #testing }
FamixStImplicitVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].

	self name ifNotNil: [ stream nextPutAll: self name ]
]
