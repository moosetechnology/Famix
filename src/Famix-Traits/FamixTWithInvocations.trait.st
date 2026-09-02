"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|



"
Trait {
	#name : 'FamixTWithInvocations',
	#instVars : [
		'#outgoingInvocations => FMMany type: #FamixTInvocation opposite: #sender'
	],
	#category : 'Famix-Traits-Invocation',
	#package : 'Famix-Traits',
	#tag : 'Invocation'
}

{ #category : 'meta' }
FamixTWithInvocations classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithInvocations super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTWithInvocations >> addOutgoingInvocation: anInvocation [
	outgoingInvocations add: anInvocation
]

{ #category : 'Famix-Extensions-private' }
FamixTWithInvocations >> numberOfOutgoingInvocations [

	<FMProperty: #numberOfOutgoingInvocations type: #Number>
	<derived>
	<FMComment: 'The number of invocations in a method'>
	^ self cacheAt: #numberOfOutgoingInvocations ifAbsent: [ self outgoingInvocations size ]
]

{ #category : 'accessing' }
FamixTWithInvocations >> outgoingInvocations [
	"Relation named: #outgoingInvocations type: #FamixTInvocation opposite: #sender"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Outgoing invocations sent by this behaviour.'>
	<derived>
	^ outgoingInvocations
]

{ #category : 'accessing' }
FamixTWithInvocations >> outgoingInvocations: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingInvocations value: anObject
]

{ #category : 'adding' }
FamixTWithInvocations >> outgoingInvocationsGroup [
	<navigation: 'Outgoing invocations'>
	^ self cacheAt:
		#outgoingInvocationsGroup
		ifAbsentPut:
			[MooseGroup
				withAll: self outgoingInvocations
				withDescription: 'Outgoing invocations from ' , self mooseName]
]
