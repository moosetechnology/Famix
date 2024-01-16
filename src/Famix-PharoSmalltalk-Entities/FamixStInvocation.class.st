"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `sender` | `FamixTWithInvocations` | `outgoingInvocations` | Behavioural entity making the call. from-side of the association|

### Association target
| Relation | Type | Opposite | Comment |
| `candidates` | `FamixTInvocable` | `incomingInvocations` | List of candidate behavioural entities for receiving the invocation|

### Other
| Relation | Type | Opposite | Comment |
| `next` | `FamixTAssociation` | `previous` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `receiver` | `FamixTInvocationsReceiver` | `receivingInvocations` | Named entity (variable, class...) receiving the invocation. to-side of the association|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `signature` | String | Signature of the message being sent|

"
Class {
	#name : #FamixStInvocation,
	#superclass : #FamixStEntity,
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStInvocation class >> annotation [

	<FMClass: #Invocation super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #initialization }
FamixStInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : #'instance creation' }
FamixStInvocation >> isASureInvocation [
	"Test if the receiver (an invocation) is sure (i.e. we know for sure the class of the invocation's receiver)"

	| invoRVar |
	invoRVar := self receiver.
	^ invoRVar isNotNil and: [ invoRVar class = FamixStClass or: [ invoRVar isImplicitVariable and: [ invoRVar isSelf or: [ invoRVar isSuper ] ] ] ]
]
