"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingIncludeRelations` | `FamixTWithFileIncludes` | `target` | `FamixTFileInclude` | The include entities that have this file as a target.|
| `outgoingIncludeRelations` | `FamixTWithFileIncludes` | `source` | `FamixTFileInclude` | The include entities that have this file as a source.|



"
Trait {
	#name : 'FamixTWithFileIncludes',
	#instVars : [
		'#incomingIncludeRelations => FMMany type: #FamixTFileInclude opposite: #target',
		'#outgoingIncludeRelations => FMMany type: #FamixTFileInclude opposite: #source'
	],
	#category : 'Famix-Traits-FileInclude',
	#package : 'Famix-Traits',
	#tag : 'FileInclude'
}

{ #category : 'meta' }
FamixTWithFileIncludes classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithFileIncludes super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTWithFileIncludes >> addIncomingIncludeRelation: anObject [
	incomingIncludeRelations add: anObject

]

{ #category : 'accessing' }
FamixTWithFileIncludes >> addOutgoingIncludeRelation: anObject [
	outgoingIncludeRelations add: anObject

]

{ #category : 'accessing' }
FamixTWithFileIncludes >> incomingIncludeRelations [
	"Relation named: #incomingIncludeRelations type: #FamixTFileInclude opposite: #target"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The include entities that have this file as a target.'>
	<derived>
	^ incomingIncludeRelations
]

{ #category : 'accessing' }
FamixTWithFileIncludes >> incomingIncludeRelations: anObject [

	<ignoreForCoverage>
	<generated>
	incomingIncludeRelations value: anObject
]

{ #category : 'accessing' }
FamixTWithFileIncludes >> outgoingIncludeRelations [
	"Relation named: #outgoingIncludeRelations type: #FamixTFileInclude opposite: #source"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The include entities that have this file as a source.'>
	<derived>
	^ outgoingIncludeRelations
]

{ #category : 'accessing' }
FamixTWithFileIncludes >> outgoingIncludeRelations: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingIncludeRelations value: anObject
]
