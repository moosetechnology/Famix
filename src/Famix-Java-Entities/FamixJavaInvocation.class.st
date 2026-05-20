"
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
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `signature` | `String` | nil | Signature of the message being sent|

"
Class {
	#name : 'FamixJavaInvocation',
	#superclass : 'FamixJavaEntity',
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaInvocation class >> annotation [

	<FMClass: #Invocation super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'initialization' }
FamixJavaInvocation >> initialize [

	super initialize.
	signature := 'nosignature'.
]

{ #category : 'printing' }
FamixJavaInvocation >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $#.
	aStream << self signature.
	aStream << ' (Invocation)'
]

{ #category : 'accessing' }
FamixJavaInvocation >> receiverSourceCode [
	^ self receiver sourceText
]
