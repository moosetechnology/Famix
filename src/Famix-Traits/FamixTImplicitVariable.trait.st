"
FamixTImplicitVariable represents a variable defined by the compiler in a context, such as self, super, thisContext.

## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentBehaviouralEntity` | `FamixTWithImplicitVariables` | `implicitVariables` | The behaviour containing this implicit variable. belongsTo implementation|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingAccesses` | `FamixTAccess` | `variable` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Type | Opposite | Comment |
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTImplicitVariable,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithImplicitVariables opposite: #implicitVariables'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-ImplicitVariable'
}

{ #category : #meta }
FamixTImplicitVariable classSide >> annotation [

	<FMClass: #TImplicitVariable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #testing }
FamixTImplicitVariable >> isImplicitVariable [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTImplicitVariable >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixTWithImplicitVariables opposite: #implicitVariables"

	<generated>
	<FMComment: 'The behaviour containing this implicit variable. belongsTo implementation'>
	<container>
	^ parentBehaviouralEntity
]

{ #category : #accessing }
FamixTImplicitVariable >> parentBehaviouralEntity: anObject [

	parentBehaviouralEntity := anObject.
	self resetMooseName.
	

]

{ #category : #navigation }
FamixTImplicitVariable >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseSpecializedGroup with: self parentBehaviouralEntity
]
