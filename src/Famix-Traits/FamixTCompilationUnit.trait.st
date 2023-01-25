"
I represent a compilation unit file. Typically a .c or .cpp file
"
Trait {
	#name : #FamixTCompilationUnit,
	#instVars : [
		'#compilationUnitOwner => FMOne type: #FamixTWithCompilationUnits opposite: #compilationUnit'
	],
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Traits-CompilationUnit'
}

{ #category : #meta }
FamixTCompilationUnit classSide >> annotation [

	<FMClass: #TCompilationUnit super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTCompilationUnit >> compilationUnitOwner [
	"Relation named: #compilationUnitOwner type: #FamixTWithCompilationUnits opposite: #compilationUnit"

	<generated>
	<FMComment: 'The compilation unit that defines this module'>
	<container>
	^ compilationUnitOwner
]

{ #category : #accessing }
FamixTCompilationUnit >> compilationUnitOwner: anObject [

	<generated>
	compilationUnitOwner := anObject
]

{ #category : #navigation }
FamixTCompilationUnit >> compilationUnitOwnerGroup [
	<generated>
	<navigation: 'CompilationUnitOwner'>
	^ MooseSpecializedGroup with: self compilationUnitOwner
]
