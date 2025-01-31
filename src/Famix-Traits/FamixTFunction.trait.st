"
FamixTFunction represents a behavioural entity in a procedural language.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `functionOwner` | `FamixTFunction` | `functions` | `FamixTWithFunctions` | The container defining the function. The function is placed in a container, because certain languages can nest functions in functions.|

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
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

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
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `signature` | `String` | nil | Signature of the message being sent|

"
Trait {
	#name : #FamixTFunction,
	#instVars : [
		'#functionOwner => FMOne type: #FamixTWithFunctions opposite: #functions'
	],
	#traits : 'FamixTHasSignature + FamixTInvocable + FamixTNamedEntity + FamixTTypedEntity + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + TEntityMetaLevelDependency',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTNamedEntity classTrait + FamixTTypedEntity classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTFunction classSide >> annotation [

	<FMClass: #TFunction super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTFunction >> functionOwner [
	"Relation named: #functionOwner type: #FamixTWithFunctions opposite: #functions"

	<generated>
	<FMComment: 'The container defining the function. The function is placed in a container, because certain languages can nest functions in functions.'>
	<container>
	^ functionOwner
]

{ #category : #accessing }
FamixTFunction >> functionOwner: anObject [

	functionOwner := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTFunction >> functionOwnerGroup [
	<generated>
	<navigation: 'FunctionOwner'>
	^ MooseSpecializedGroup with: self functionOwner
]

{ #category : #testing }
FamixTFunction >> isFunction [

	<generated>
	^ true
]

{ #category : #printing }
FamixTFunction >> mooseNameOn: stream [
	| parent |
	parent := self functionOwner.
	parent
		ifNotNil: [ parent mooseNameOn: stream.
			stream nextPut: $. ].
	self signature ifNotNil: [ stream nextPutAll: self signature ] ifNil: [ self name ifNotNil: [ stream nextPutAll: self name ] ]
]
