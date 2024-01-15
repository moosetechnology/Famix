"
I represent a compilation unit file. Typically a .c or .cpp file

## Relations
======================

### Parents
- Relation: #parentFolder Type: #FamixTFolder Opposite: #childrenFileSystemEntities Comment: Folder entity containing this file.
- Relation: #compilationUnitOwner Type: #FamixTWithCompilationUnits Opposite: #compilationUnit Comment: The compilation unit that defines this module
### Other
- Relation: #entities Type: #FamixTWithFiles Opposite: #containerFiles Comment: List of entities defined in the file


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
	^ self
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
