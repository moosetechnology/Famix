"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|



"
Trait {
	#name : #FamixTWithLocalVariables,
	#instVars : [
		'#localVariables => FMMany type: #FamixTLocalVariable opposite: #parentBehaviouralEntity'
	],
	#category : #'Famix-Traits-LocalVariable'
}

{ #category : #meta }
FamixTWithLocalVariables classSide >> annotation [

	<FMClass: #TWithLocalVariables super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithLocalVariables >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithLocalVariables: self
]

{ #category : #accessing }
FamixTWithLocalVariables >> addLocalVariable: aLocalVariable [
	localVariables add: aLocalVariable
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables [
	"Relation named: #localVariables type: #FamixTLocalVariable opposite: #parentBehaviouralEntity"

	<generated>
	<FMComment: 'Variables locally defined by this behaviour.'>
	<derived>
	^ localVariables
]

{ #category : #accessing }
FamixTWithLocalVariables >> localVariables: anObject [

	<generated>
	localVariables value: anObject
]
