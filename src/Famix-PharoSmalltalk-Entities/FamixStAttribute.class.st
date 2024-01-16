"
## Relations
======================

### Parents
- Relation: #parentType Type: #FamixTWithAttributes Opposite: #attributes Comment: Type declaring the attribute. belongsTo implementation
### Incoming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isClassSide Type: Boolean Comment: Entity can be declared class side i.e. static
- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Class {
	#name : #FamixStAttribute,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTAttribute + FamixTCanBeClassSide + FamixTInvocationsReceiver',
	#classTraits : 'FamixTAttribute classTrait + FamixTCanBeClassSide classTrait + FamixTInvocationsReceiver classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> beSharedVariable [

	self propertyNamed: #sharedVariable put: true 
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> isSharedVariable [
	^ self propertyNamed: #sharedVariable ifNil: [ false ]
]
