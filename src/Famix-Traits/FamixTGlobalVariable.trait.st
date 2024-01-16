"
FamixTGlobalVariable represents a global variable in the source code.


## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentScope` | `FamixTWithGlobalVariables` | `globalVariables` | Scope declaring the global variable. belongsTo implementation|

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
	#name : #FamixTGlobalVariable,
	#instVars : [
		'#parentScope => FMOne type: #FamixTWithGlobalVariables opposite: #globalVariables'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-GlobalVariable'
}

{ #category : #meta }
FamixTGlobalVariable classSide >> annotation [

	<FMClass: #TGlobalVariable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTGlobalVariable classSide >> annotationFamixGlobalVariableGroup [
	<generated>
	<mooseGroup>
	^ FamixGlobalVariableGroup
]

{ #category : #testing }
FamixTGlobalVariable >> isGlobalVariable [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTGlobalVariable >> parentScope [
	"Relation named: #parentScope type: #FamixTWithGlobalVariables opposite: #globalVariables"

	<generated>
	<FMComment: 'Scope declaring the global variable. belongsTo implementation'>
	<container>
	^ parentScope
]

{ #category : #accessing }
FamixTGlobalVariable >> parentScope: anObject [

	<generated>
	parentScope := anObject
]

{ #category : #navigation }
FamixTGlobalVariable >> parentScopeGroup [
	<generated>
	<navigation: 'ParentScope'>
	^ MooseSpecializedGroup with: self parentScope
]
