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
	#name : #FamixJavaInvocation,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInvocation class >> annotation [

	<FMClass: #Invocation super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #initialization }
FamixJavaInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : #testing }
FamixJavaInvocation >> isAPotentialInvocation [
	"test if the sender is a potential invocation"
	| invokedMtdSignature invoRVar invokedMtd |
	invokedMtdSignature := self signature.
	invokedMtdSignature ifNil:[^false].
	invoRVar := self receiver.
			
	invoRVar ifNil:[^true].
	
	(invoRVar isImplicitVariable or: [invoRVar class = FamixJavaClass]) ifFalse:[^true].
	
	(invoRVar isImplicitVariable 
	 and: [(invoRVar isSelf or: [invoRVar isSuper]) not]) ifTrue:[^true].
		 
	(invoRVar isImplicitVariable 
	 	and: [(invokedMtd := self getReceivingFAMIXClass lookUp: invokedMtdSignature) isNil 
					or: [invokedMtd isAbstract]]) ifTrue:[^true].

	^false
	
]

{ #category : #testing }
FamixJavaInvocation >> isASureInvocation [
	"Test if the receiver (an invocation) is sure (i.e. we know for sure the class of the invocation's receiver)"

	| invoRVar |
	invoRVar := self receiver.
	^ invoRVar isNotNil and: [ invoRVar class = FamixJavaClass or: [ invoRVar isImplicitVariable and: [ invoRVar isSelf or: [ invoRVar isSuper ] ] ] ]
]

{ #category : #printing }
FamixJavaInvocation >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $#.
	aStream << self signature.
	aStream << ' (Invocation)'
]

{ #category : #accessing }
FamixJavaInvocation >> receiverSourceCode [
	^ self receiver sourceText
]
