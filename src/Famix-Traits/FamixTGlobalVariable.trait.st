"
FamixTGlobalVariable represents a global variable in the source code.


## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentScope` | `FamixTGlobalVariable` | `globalVariables` | `FamixTWithGlobalVariables` | Scope declaring the global variable. belongsTo implementation|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

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

{ #category : #visitor }
FamixTGlobalVariable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTGlobalVariable: self
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
