"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|



"
Trait {
	#name : 'FamixTWithLocalVariables',
	#instVars : [
		'#localVariables => FMMany type: #FamixTLocalVariable opposite: #parentBehaviouralEntity'
	],
	#category : 'Famix-Traits-LocalVariable',
	#package : 'Famix-Traits',
	#tag : 'LocalVariable'
}

{ #category : 'meta' }
FamixTWithLocalVariables classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithLocalVariables super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTWithLocalVariables >> addLocalVariable: aLocalVariable [
	localVariables add: aLocalVariable
]

{ #category : 'accessing' }
FamixTWithLocalVariables >> localVariables [
	"Relation named: #localVariables type: #FamixTLocalVariable opposite: #parentBehaviouralEntity"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Variables locally defined by this behaviour.'>
	<derived>
	^ localVariables
]

{ #category : 'accessing' }
FamixTWithLocalVariables >> localVariables: anObject [

	<ignoreForCoverage>
	<generated>
	localVariables value: anObject
]
