"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `functions` | `FamixTWithFunctions` | `functionOwner` | `FamixTFunction` | Functions defined in the container, if any.|



"
Trait {
	#name : 'FamixTWithFunctions',
	#instVars : [
		'#functions => FMMany type: #FamixTFunction opposite: #functionOwner'
	],
	#category : 'Famix-Traits-Behavioral',
	#package : 'Famix-Traits',
	#tag : 'Behavioral'
}

{ #category : 'meta' }
FamixTWithFunctions classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithFunctions super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTWithFunctions >> addFunction: anObject [
	functions add: anObject

]

{ #category : 'accessing' }
FamixTWithFunctions >> functions [
	"Relation named: #functions type: #FamixTFunction opposite: #functionOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Functions defined in the container, if any.'>
	<derived>
	^ functions
]

{ #category : 'accessing' }
FamixTWithFunctions >> functions: anObject [

	<ignoreForCoverage>
	<generated>
	functions value: anObject
]
