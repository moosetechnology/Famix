"
FamixTMethod represents a behaviour in an object-oriented language.

A FamixTMethod is always contained in a parentType.

## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentType` | `FamixTWithMethods` | `methods` | Type declaring the method. It provides the implementation for belongsTo.|

### Children
| Relation | Type | Opposite | Comment |
| `implicitVariables` | `FamixTImplicitVariable` | `parentBehaviouralEntity` | Implicit variables used locally by this behaviour.|
| `localVariables` | `FamixTLocalVariable` | `parentBehaviouralEntity` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTParameter` | `parentBehaviouralEntity` | List of formal parameters declared by this behaviour.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `accesses` | `FamixTAccess` | `accessor` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTInvocation` | `sender` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTReference` | `referencer` | References from this entity to other entities.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingInvocations` | `FamixTInvocation` | `candidates` | Incoming invocations from other behaviours computed by the candidate operator.|

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
	#name : #FamixTMethod,
	#instVars : [
		'#parentType => FMOne type: #FamixTWithMethods opposite: #methods'
	],
	#traits : 'FamixTHasSignature + FamixTInvocable + FamixTMethodMetrics + FamixTNamedEntity + FamixTTypedEntity + FamixTWithImplicitVariables + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + TEntityMetaLevelDependency',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTMethodMetrics classTrait + FamixTNamedEntity classTrait + FamixTTypedEntity classTrait + FamixTWithImplicitVariables classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTMethod classSide >> annotation [

	<FMClass: #TMethod super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTMethod classSide >> annotationFamixMethodGroup [
	<generated>
	<mooseGroup>
	^ FamixMethodGroup
]

{ #category : #testing }
FamixTMethod >> isDelegating [

	^ (self outgoingInvocations flatCollect: #target) anySatisfy: [ :each | 
		  each signature == self signature and: [ 
			  (each isInSameClassAs: self) not ] ] 
]

{ #category : #testing }
FamixTMethod >> isExtending [

	^ (self outgoingInvocations reject: [ :each | each receiver isNil ]) 
		  anySatisfy: [ :each | 
			  each receiver name = 'super' and: [ 
				  (each candidates collect: #signature) includes: self signature ] ]
]

{ #category : #testing }
FamixTMethod >> isInSameClassAs: aMethod [

	^ aMethod parentType == self parentType
]

{ #category : #testing }
FamixTMethod >> isMethod [

	<generated>
	^ true
]

{ #category : #printing }
FamixTMethod >> mooseNameOn: stream [
	self parentType
		ifNotNil: [ :parent | 
			parent mooseNameOn: stream.
			stream nextPut: $. ].
	self signature
		ifNotNil: [ :aSignature | stream nextPutAll: aSignature ]
		ifNil: [ self name ifNotNil: [ :aName | stream nextPutAll: aName ] ]
]

{ #category : #accessing }
FamixTMethod >> parentType [
	"Relation named: #parentType type: #FamixTWithMethods opposite: #methods"

	<generated>
	<FMComment: 'Type declaring the method. It provides the implementation for belongsTo.'>
	<container>
	^ parentType
]

{ #category : #accessing }
FamixTMethod >> parentType: anObject [

	parentType := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTMethod >> parentTypeGroup [
	<generated>
	<navigation: 'ParentType'>
	^ MooseSpecializedGroup with: self parentType
]

{ #category : #testing }
FamixTMethod >> parentTypeIsStub [

	^ self parentType ifNotNil: [ :e | e isStub ] ifNil: [ true ]
]
