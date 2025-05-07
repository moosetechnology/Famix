"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|



"
Trait {
	#name : #FamixTWithInvocations,
	#instVars : [
		'#outgoingInvocations => FMMany type: #FamixTInvocation opposite: #sender'
	],
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTWithInvocations classSide >> annotation [

	<FMClass: #TWithInvocations super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithInvocations >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithInvocations: self
]

{ #category : #adding }
FamixTWithInvocations >> addOutgoingInvocation: anInvocation [
	outgoingInvocations add: anInvocation
]

{ #category : #'Famix-Extensions-private' }
FamixTWithInvocations >> numberOfOutgoingInvocations [

	<FMProperty: #numberOfOutgoingInvocations type: #Number>
	<derived>
	<FMComment: 'The number of invocations in a method'>
	^ self
		  lookUpPropertyNamed: #numberOfOutgoingInvocations
		  computedAs: [ self outgoingInvocations size ]
]

{ #category : #accessing }
FamixTWithInvocations >> outgoingInvocations [
	"Relation named: #outgoingInvocations type: #FamixTInvocation opposite: #sender"

	<generated>
	<FMComment: 'Outgoing invocations sent by this behaviour.'>
	<derived>
	^ outgoingInvocations
]

{ #category : #accessing }
FamixTWithInvocations >> outgoingInvocations: anObject [

	<generated>
	outgoingInvocations value: anObject
]

{ #category : #adding }
FamixTWithInvocations >> outgoingInvocationsGroup [
	<navigation: 'Outgoing invocations'>
	^ self cacheAt:
		#outgoingInvocationsGroup
		ifAbsentPut:
			[MooseGroup
				withAll: self outgoingInvocations
				withDescription: 'Outgoing invocations from ' , self mooseName]
]
