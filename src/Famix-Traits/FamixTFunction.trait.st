"
FamixTFunction represents a behavioural entity in a procedural language.

## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `functionOwner` | `FamixTWithFunctions` | `functions` | The container defining the function. The function is placed in a container, because certain languages can nest functions in functions.|

### Children
| Relation | Type | Opposite | Comment |
| `localVariables` | `FamixTLocalVariable` | `parentBehaviouralEntity` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTParameter` | `parentBehaviouralEntity` | List of formal parameters declared by this behaviour.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `accesses` | `FamixTAccess` | `accessor` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTInvocation` | `sender` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTReference` | `referencer` | References from this entity to other entities.|

### Other
| Relation | Type | Opposite | Comment |
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|
| `signature` | String | Signature of the message being sent|

"
Trait {
	#name : #FamixTFunction,
	#instVars : [
		'#functionOwner => FMOne type: #FamixTWithFunctions opposite: #functions'
	],
	#traits : 'FamixTHasSignature + FamixTNamedEntity + FamixTTypedEntity + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + TEntityMetaLevelDependency',
	#classTraits : 'FamixTHasSignature classTrait + FamixTNamedEntity classTrait + FamixTTypedEntity classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + TEntityMetaLevelDependency classTrait',
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
