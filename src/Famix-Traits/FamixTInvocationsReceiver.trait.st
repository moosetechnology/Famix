"
It corresponds to the entity that can be the receiver of an invocation.
FamixTInvocation has:
   (i)  sender: the behavioral entity that sends the message;
   (ii) receiver: the structural entity (variable) that receives the message;
   (iii) candidates: the list of potential behavioral entities that are actually being invoked. This is particularly useful for dynamic languages.



## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|



"
Trait {
	#name : 'FamixTInvocationsReceiver',
	#instVars : [
		'#receivingInvocations => FMMany type: #FamixTInvocation opposite: #receiver'
	],
	#category : 'Famix-Traits-Invocation',
	#package : 'Famix-Traits',
	#tag : 'Invocation'
}

{ #category : 'meta' }
FamixTInvocationsReceiver classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TInvocationsReceiver super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTInvocationsReceiver >> addReceivingInvocation: anInvocation [
	receivingInvocations add: anInvocation
]

{ #category : 'accessing' }
FamixTInvocationsReceiver >> receivingInvocations [
	"Relation named: #receivingInvocations type: #FamixTInvocation opposite: #receiver"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'List of invocations performed on this entity (considered as the receiver)'>
	^ receivingInvocations
]

{ #category : 'accessing' }
FamixTInvocationsReceiver >> receivingInvocations: anObject [

	<ignoreForCoverage>
	<generated>
	receivingInvocations value: anObject
]
