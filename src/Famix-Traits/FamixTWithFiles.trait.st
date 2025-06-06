"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `containerFiles` | `FamixTWithFiles` | `entities` | `FamixTFile` | List of files containing the entity|



"
Trait {
	#name : #FamixTWithFiles,
	#instVars : [
		'#containerFiles => FMMany type: #FamixTFile opposite: #entities'
	],
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTWithFiles classSide >> annotation [

	<FMClass: #TWithFiles super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithFiles >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithFiles: self
]

{ #category : #accessing }
FamixTWithFiles >> addContainerFile: anObject [
	containerFiles add: anObject

]

{ #category : #accessing }
FamixTWithFiles >> containerFiles [
	"Relation named: #containerFiles type: #FamixTFile opposite: #entities"

	<generated>
	<FMComment: 'List of files containing the entity'>
	^ containerFiles
]

{ #category : #accessing }
FamixTWithFiles >> containerFiles: anObject [

	<generated>
	containerFiles value: anObject
]
