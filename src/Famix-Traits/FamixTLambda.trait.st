"
FamixTLabmda represents a behavioural entity that does not have a name. It can be used to represent lambdas, closures, blocks...

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lambdaContainer` | `FamixTLambda` | `lambdas` | `FamixTWithLambdas` | The container defining the lambda expression. The lambda is placed in a container, because certain languages can nest lambdas in lambdas.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `signature` | `String` | nil | Signature of the message being sent|

"
Trait {
	#name : #FamixTLambda,
	#instVars : [
		'#lambdaContainer => FMOne type: #FamixTWithLambdas opposite: #lambdas'
	],
	#traits : 'FamixTHasSignature + FamixTInvocable + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + TEntityMetaLevelDependency',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Lambda'
}

{ #category : #meta }
FamixTLambda classSide >> annotation [

	<FMClass: #TLambda super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTLambda >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTLambda: self
]

{ #category : #accessing }
FamixTLambda >> lambdaContainer [
	"Relation named: #lambdaContainer type: #FamixTWithLambdas opposite: #lambdas"

	<generated>
	<FMComment: 'The container defining the lambda expression. The lambda is placed in a container, because certain languages can nest lambdas in lambdas.'>
	<container>
	^ lambdaContainer
]

{ #category : #accessing }
FamixTLambda >> lambdaContainer: anObject [

	<generated>
	lambdaContainer := anObject
]

{ #category : #navigation }
FamixTLambda >> lambdaContainerGroup [
	<generated>
	<navigation: 'LambdaContainer'>
	^ MooseSpecializedGroup with: self lambdaContainer
]
