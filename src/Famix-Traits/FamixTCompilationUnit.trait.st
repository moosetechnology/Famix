"
I represent a compilation unit file. Typically a .c or .cpp file

## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `compilationUnitOwner` | `FamixTWithCompilationUnits` | `compilationUnit` | The compilation unit that defines this module|
| `parentFolder` | `FamixTFolder` | `childrenFileSystemEntities` | Folder entity containing this file.|

### Other
| Relation | Type | Opposite | Comment |
| `entities` | `FamixTWithFiles` | `containerFiles` | List of entities defined in the file|



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
