"
A container having Global variables

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `globalVariables` | `FamixTWithGlobalVariables` | `parentScope` | `FamixTGlobalVariable` | Global variables defined in the scope, if any.|



"
Trait {
	#name : 'FamixTWithGlobalVariables',
	#instVars : [
		'#globalVariables => FMMany type: #FamixTGlobalVariable opposite: #parentScope'
	],
	#category : 'Famix-Traits-GlobalVariable',
	#package : 'Famix-Traits',
	#tag : 'GlobalVariable'
}

{ #category : 'meta' }
FamixTWithGlobalVariables classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithGlobalVariables super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTWithGlobalVariables >> addGlobalVariable: anObject [

	<ignoreForCoverage>
	<generated>
	^ self globalVariables add: anObject
]

{ #category : 'accessing' }
FamixTWithGlobalVariables >> globalVariables [
	"Relation named: #globalVariables type: #FamixTGlobalVariable opposite: #parentScope"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Global variables defined in the scope, if any.'>
	<derived>
	^ globalVariables
]

{ #category : 'accessing' }
FamixTWithGlobalVariables >> globalVariables: anObject [

	<ignoreForCoverage>
	<generated>
	globalVariables value: anObject
]
