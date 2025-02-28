"
I represent a compilation unit file. Typically a .c or .cpp file

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnitOwner` | `FamixTCompilationUnit` | `compilationUnit` | `FamixTWithCompilationUnits` | The compilation unit that defines this module|
| `parentFolder` | `FamixTFileSystemEntity` | `childrenFileSystemEntities` | `FamixTFolder` | Folder entity containing this file.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entities` | `FamixTFile` | `containerFiles` | `FamixTWithFiles` | List of entities defined in the file|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

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
