"
It corresponds to the candidates of an invocation.
FamixTInvocation has:
   (i)  sender: the behavioral entity that sends the message;
   (ii) receiver: the structural entity (variable) that receives the message;
   (iii) candidates: the list of potential behavioral entities that are actually being invoked. This is particularly useful for dynamic languages.

Candidates use the trait TInvocable.



## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|



"
Trait {
	#name : 'FamixTInvocable',
	#instVars : [
		'#incomingInvocations => FMMany type: #FamixTInvocation opposite: #candidates'
	],
	#category : 'Famix-Traits-Invocation',
	#package : 'Famix-Traits',
	#tag : 'Invocation'
}

{ #category : 'meta' }
FamixTInvocable classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TInvocable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTInvocable >> addIncomingInvocation: anInvocation [
	incomingInvocations add: anInvocation
]

{ #category : 'accessing' }
FamixTInvocable >> incomingInvocations [
	"Relation named: #incomingInvocations type: #FamixTInvocation opposite: #candidates"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Incoming invocations from other behaviours computed by the candidate operator.'>
	^ incomingInvocations
]

{ #category : 'accessing' }
FamixTInvocable >> incomingInvocations: anObject [

	<ignoreForCoverage>
	<generated>
	incomingInvocations value: anObject
]
