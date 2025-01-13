"
FamixTInvocation represents the invocation of a message (signature) on a receiver by a behavioural entity. 
FamixTInvocation has:
   (i)  sender: the behavioral entity that sends the message;
   (ii) receiver: the structural entity (variable) that receives the message;
   (iii) candidates: the list of potential behavioral entities that are actually being invoked. This is particularly useful for dynamic languages.

In an invocation, From is the sender of the message and To is the list of candidates. For each invocation in the source code, there is one famix invocation created even if it is from the same behavioral entity towards the same variable and the same message. For example in smalltalk, the following code
anObject aSelector.
will produce one invocation association from current method to a variable anObject with candidate aSelector. The list of candidates will also contain all the methods defining a similar signature as aSelector. 


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
Trait {
	#name : #FamixTInvocation,
	#instVars : [
		'#candidates => FMMany type: #FamixTInvocable opposite: #incomingInvocations',
		'#receiver => FMOne type: #FamixTInvocationsReceiver opposite: #receivingInvocations',
		'#sender => FMOne type: #FamixTWithInvocations opposite: #outgoingInvocations'
	],
	#traits : 'FamixTAssociation + FamixTHasSignature',
	#classTraits : 'FamixTAssociation classTrait + FamixTHasSignature classTrait',
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTInvocation classSide >> annotation [

	<FMClass: #TInvocation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTInvocation classSide >> annotationFamixInvocationGroup [
	<generated>
	<mooseGroup>
	^ FamixInvocationGroup
]

{ #category : #adding }
FamixTInvocation >> addCandidate: aBehaviouralEntity [ 
	candidates add: aBehaviouralEntity
]

{ #category : #accessing }
FamixTInvocation >> anyCandidate [
	^ self candidates ifEmpty: [ nil ] ifNotEmpty: [ self candidates at: 1 ]
]

{ #category : #accessing }
FamixTInvocation >> candidates [
	"Relation named: #candidates type: #FamixTInvocable opposite: #incomingInvocations"

	<generated>
	<FMComment: 'List of candidate behavioural entities for receiving the invocation'>
	<target>
	^ candidates
]

{ #category : #accessing }
FamixTInvocation >> candidates: anObject [

	<generated>
	candidates value: anObject
]

{ #category : #printing }
FamixTInvocation >> displayFullStringOn: aStream [

	self sender
		ifNotNil: [ self sender displayFullStringOn: aStream ]
		ifNil: [ aStream nextPut: $? ].
	aStream nextPutAll: ' -> '.
	self receiver
		ifNotNil: [ :rcvr | self receiver displayFullStringOn: aStream ]
		ifNil: [ aStream nextPut: $? ].
	aStream nextPutAll: '.'.

	self signature
		ifNotNil: [ aStream nextPutAll: (self signature truncateWithElipsisTo: 40) ]
		ifNil: [ aStream nextPutAll: ' ? ' ]
]

{ #category : #printing }
FamixTInvocation >> displayStringOn: aStream [

	self sender
		ifNotNil: [ self sender displayStringOn: aStream ]
		ifNil: [ aStream nextPut: $? ].
	aStream nextPutAll: ' -> '.
	self receiver
		ifNotNil: [ :rcvr | self receiver displayStringOn: aStream ]
		ifNil: [ aStream nextPut: $? ].
	aStream nextPutAll: ' . '.

	self signature
		ifNotNil: [ 
		aStream nextPutAll: (self signature truncateWithElipsisTo: 40) ]
		ifNil: [ aStream nextPutAll: ' ? ' ]
]

{ #category : #'instance creation' }
FamixTInvocation >> getReceivingFAMIXClass [

	self
		deprecated: 'Please use getReceivingFamixClass instead'
		transformWith: '`@receiver getReceivingFAMIXClass'
			-> '`@receiver getReceivingFamixClass'.
	^ self getReceivingFamixClass
]

{ #category : #'instance creation' }
FamixTInvocation >> getReceivingFamixClass [

	"Returns the Famix class of the receiver. If the receiver is a Famix class, this one is returned. 
	If it is self or super, the corresponding Famix class is returned. 
	The receiver may not be nil"

	| tmpReceiver |
	tmpReceiver := self receiver.

	tmpReceiver isImplicitVariable
		ifTrue: [ 
			| belongsTo |
			belongsTo := tmpReceiver belongsTo parentType.
			tmpReceiver isSelf ifTrue: [ ^ belongsTo ].
			tmpReceiver isSuper ifTrue: [ 
				^ belongsTo superclass ifNil: [ belongsTo ] ] ]
		ifFalse: [ ^ tmpReceiver ]
]

{ #category : #accessing }
FamixTInvocation >> invokedEntity [
	"This method returns only one candidate if there is one, or raises an error if there is more or less than one candidate."

	self candidates size = 1 ifFalse: [
		self error: '1 candidate was expected but ' , self candidates size asString , ' candidates are present in this invocation.' ].

	^ self candidates anyOne
]

{ #category : #testing }
FamixTInvocation >> isInvocation [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTInvocation >> receiver [
	"Relation named: #receiver type: #FamixTInvocationsReceiver opposite: #receivingInvocations"

	<generated>
	<FMComment: 'Named entity (variable, class...) receiving the invocation. to-side of the association'>
	^ receiver
]

{ #category : #accessing }
FamixTInvocation >> receiver: anObject [

	<generated>
	receiver := anObject
]

{ #category : #accessing }
FamixTInvocation >> sender [
	"Relation named: #sender type: #FamixTWithInvocations opposite: #outgoingInvocations"

	<generated>
	<FMComment: 'Behavioural entity making the call. from-side of the association'>
	<source>
	^ sender
]

{ #category : #accessing }
FamixTInvocation >> sender: anObject [

	<generated>
	sender := anObject
]
