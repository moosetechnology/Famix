"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|



"
Trait {
	#name : #FamixTInvocationsReceiver,
	#instVars : [
		'#receivingInvocations => FMMany type: #FamixTInvocation opposite: #receiver'
	],
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTInvocationsReceiver classSide >> annotation [

	<FMClass: #TInvocationsReceiver super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTInvocationsReceiver >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTInvocationsReceiver: self
]

{ #category : #adding }
FamixTInvocationsReceiver >> addReceivingInvocation: anInvocation [
	receivingInvocations add: anInvocation
]

{ #category : #accessing }
FamixTInvocationsReceiver >> receivingInvocations [
	"Relation named: #receivingInvocations type: #FamixTInvocation opposite: #receiver"

	<generated>
	<FMComment: 'List of invocations performed on this entity (considered as the receiver)'>
	<derived>
	^ receivingInvocations
]

{ #category : #accessing }
FamixTInvocationsReceiver >> receivingInvocations: anObject [

	<generated>
	receivingInvocations value: anObject
]
