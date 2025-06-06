"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implicitVariables` | `FamixTWithImplicitVariables` | `parentBehaviouralEntity` | `FamixTImplicitVariable` | Implicit variables used locally by this behaviour.|



"
Trait {
	#name : #FamixTWithImplicitVariables,
	#instVars : [
		'#implicitVariables => FMMany type: #FamixTImplicitVariable opposite: #parentBehaviouralEntity'
	],
	#category : #'Famix-Traits-ImplicitVariable'
}

{ #category : #meta }
FamixTWithImplicitVariables classSide >> annotation [

	<FMClass: #TWithImplicitVariables super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithImplicitVariables >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithImplicitVariables: self
]

{ #category : #adding }
FamixTWithImplicitVariables >> addImplicitVariable: anImplicitVariable [
	implicitVariables add: anImplicitVariable
]

{ #category : #accessing }
FamixTWithImplicitVariables >> implicitVariables [
	"Relation named: #implicitVariables type: #FamixTImplicitVariable opposite: #parentBehaviouralEntity"

	<generated>
	<FMComment: 'Implicit variables used locally by this behaviour.'>
	<derived>
	^ implicitVariables
]

{ #category : #accessing }
FamixTWithImplicitVariables >> implicitVariables: anObject [

	<generated>
	implicitVariables value: anObject
]
