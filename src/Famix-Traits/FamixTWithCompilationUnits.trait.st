Trait {
	#name : #FamixTWithCompilationUnits,
	#instVars : [
		'#compilationUnit => FMOne type: #FamixTCompilationUnit opposite: #compilationUnitOwner'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithCompilationUnits classSide >> annotation [

	<FMClass: #TWithCompilationUnits super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
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
