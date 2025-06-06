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
	#name : #FamixTWithGlobalVariables,
	#instVars : [
		'#globalVariables => FMMany type: #FamixTGlobalVariable opposite: #parentScope'
	],
	#category : #'Famix-Traits-GlobalVariable'
}

{ #category : #meta }
FamixTWithGlobalVariables classSide >> annotation [

	<FMClass: #TWithGlobalVariables super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithGlobalVariables >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithGlobalVariables: self
]

{ #category : #adding }
FamixTWithGlobalVariables >> addGlobalVariable: anObject [
	<generated>
	^ self globalVariables add: anObject
]

{ #category : #accessing }
FamixTWithGlobalVariables >> globalVariables [
	"Relation named: #globalVariables type: #FamixTGlobalVariable opposite: #parentScope"

	<generated>
	<FMComment: 'Global variables defined in the scope, if any.'>
	<derived>
	^ globalVariables
]

{ #category : #accessing }
FamixTWithGlobalVariables >> globalVariables: anObject [

	<generated>
	globalVariables value: anObject
]
