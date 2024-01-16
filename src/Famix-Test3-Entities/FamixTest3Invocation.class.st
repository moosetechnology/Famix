"
## Relations
======================

### Association source
- Relation: #sender Type: #FamixTWithInvocations Opposite: #outgoingInvocations Comment: Behavioural entity making the call. from-side of the association
### Association target
- Relation: #candidates Type: #FamixTInvocable Opposite: #incomingInvocations Comment: List of candidate behavioural entities for receiving the invocation
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #receiver Type: #FamixTInvocationsReceiver Opposite: #receivingInvocations Comment: Named entity (variable, class...) receiving the invocation. to-side of the association
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #signature Type: String Comment: Signature of the message being sent

"
Class {
	#name : #FamixTest3Invocation,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Invocation class >> annotation [

	<FMClass: #Invocation super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
