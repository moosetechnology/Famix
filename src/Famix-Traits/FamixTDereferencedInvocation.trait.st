"
Represents an invocation which function is contained in a pointer.

The function itself is typically unknown (referenced by the pointer).

It has a referencer which is the pointer variable

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
- Relation: #referencer Type: #FamixTWithDereferencedInvocations Opposite: #dereferencedInvocations Comment: Structural entity that references the BehaviouralEntity invoked
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #signature Type: String Comment: Signature of the message being sent

"
Trait {
	#name : #FamixTDereferencedInvocation,
	#instVars : [
		'#referencer => FMOne type: #FamixTWithDereferencedInvocations opposite: #dereferencedInvocations'
	],
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#category : #'Famix-Traits-DereferencedInvocation'
}

{ #category : #meta }
FamixTDereferencedInvocation classSide >> annotation [

	<FMClass: #TDereferencedInvocation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTDereferencedInvocation >> referencer [
	"Relation named: #referencer type: #FamixTWithDereferencedInvocations opposite: #dereferencedInvocations"

	<generated>
	<FMComment: 'Structural entity that references the BehaviouralEntity invoked'>
	^ referencer
]

{ #category : #accessing }
FamixTDereferencedInvocation >> referencer: anObject [

	<generated>
	referencer := anObject
]
