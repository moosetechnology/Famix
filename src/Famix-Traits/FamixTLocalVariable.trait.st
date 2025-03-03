"
FamixTLocalVariable represents a local variable in the scope of a behavioural entity.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FamixTLocalVariable` | `localVariables` | `FamixTWithLocalVariables` | Behavioural entity declaring this local variable. belongsTo implementation|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTLocalVariable,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithLocalVariables opposite: #localVariables'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-LocalVariable'
}

{ #category : #meta }
FamixTLocalVariable classSide >> annotation [

	<FMClass: #TLocalVariable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #printing }
FamixTLocalVariable >> displayStringOn: aStream [

	self name ifNotNil: [ :n | aStream << n << ' in ' ].
	self parentBehaviouralEntity ifNotNil: [ :pbe | 
		pbe displayStringOn: aStream ]
]

{ #category : #testing }
FamixTLocalVariable >> isLocalVariable [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTLocalVariable >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixTWithLocalVariables opposite: #localVariables"

	<generated>
	<FMComment: 'Behavioural entity declaring this local variable. belongsTo implementation'>
	<container>
	^ parentBehaviouralEntity
]

{ #category : #accessing }
FamixTLocalVariable >> parentBehaviouralEntity: anObject [

	parentBehaviouralEntity := anObject.
	self resetMooseName.
	

]

{ #category : #navigation }
FamixTLocalVariable >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseSpecializedGroup with: self parentBehaviouralEntity
]
