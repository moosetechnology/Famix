"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `containerFiles` | `FamixTWithFiles` | `entities` | `FamixTFile` | List of files containing the entity|



"
Trait {
	#name : 'FamixTWithFiles',
	#instVars : [
		'#containerFiles => FMMany type: #FamixTFile opposite: #entities'
	],
	#category : 'Famix-Traits-File',
	#package : 'Famix-Traits',
	#tag : 'File'
}

{ #category : 'meta' }
FamixTWithFiles classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithFiles super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTWithFiles >> addContainerFile: anObject [
	containerFiles add: anObject

]

{ #category : 'accessing' }
FamixTWithFiles >> containerFiles [
	"Relation named: #containerFiles type: #FamixTFile opposite: #entities"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'List of files containing the entity'>
	^ containerFiles
]

{ #category : 'accessing' }
FamixTWithFiles >> containerFiles: anObject [

	<ignoreForCoverage>
	<generated>
	containerFiles value: anObject
]
