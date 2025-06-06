"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnit` | `FamixTWithCompilationUnits` | `compilationUnitOwner` | `FamixTCompilationUnit` | |



"
Trait {
	#name : #FamixTWithCompilationUnits,
	#instVars : [
		'#compilationUnit => FMOne type: #FamixTCompilationUnit opposite: #compilationUnitOwner'
	],
	#category : #'Famix-Traits-CompilationUnit'
}

{ #category : #meta }
FamixTWithCompilationUnits classSide >> annotation [

	<FMClass: #TWithCompilationUnits super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithCompilationUnits >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithCompilationUnits: self
]

{ #category : #accessing }
FamixTWithCompilationUnits >> compilationUnit [
	"Relation named: #compilationUnit type: #FamixTCompilationUnit opposite: #compilationUnitOwner"

	<generated>
	<derived>
	^ compilationUnit
]

{ #category : #accessing }
FamixTWithCompilationUnits >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]
