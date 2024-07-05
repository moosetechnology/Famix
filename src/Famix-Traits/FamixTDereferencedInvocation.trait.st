"
Represents an invocation which function is contained in a pointer.

The function itself is typically unknown (referenced by the pointer).

It has a referencer which is the pointer variable

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sender` | `FamixTInvocation` | `outgoingInvocations` | `FamixTWithInvocations` | Behavioural entity making the call. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `candidates` | `FamixTInvocation` | `incomingInvocations` | `FamixTInvocable` | List of candidate behavioural entities for receiving the invocation|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `receiver` | `FamixTInvocation` | `receivingInvocations` | `FamixTInvocationsReceiver` | Named entity (variable, class...) receiving the invocation. to-side of the association|
| `referencer` | `FamixTDereferencedInvocation` | `dereferencedInvocations` | `FamixTWithDereferencedInvocations` | Structural entity that references the BehaviouralEntity invoked|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `signature` | `String` | nil | Signature of the message being sent|

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
