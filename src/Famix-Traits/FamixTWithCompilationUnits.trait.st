"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FamixTWithCompilationUnits` | `compilationUnitOwner` | `FamixTCompilationUnit` | |



"
Trait {
	#name : 'FamixTWithCompilationUnits',
	#instVars : [
		'#compilationUnit => FMOne type: #FamixTCompilationUnit opposite: #compilationUnitOwner'
	],
	#category : 'Famix-Traits-Traits',
	#package : 'Famix-Traits',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixTWithCompilationUnits classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithCompilationUnits super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTWithCompilationUnits >> compilationUnit [
	"Relation named: #compilationUnit type: #FamixTCompilationUnit opposite: #compilationUnitOwner"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ compilationUnit
]

{ #category : 'accessing' }
FamixTWithCompilationUnits >> compilationUnit: anObject [

	<ignoreForCoverage>
	<generated>
	compilationUnit := anObject
]
