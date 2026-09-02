"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingImports` | `FamixTImportable` | `importedEntity` | `FamixTImport` | List of imports of this entity|



"
Trait {
	#name : 'FamixTImportable',
	#instVars : [
		'#incomingImports => FMMany type: #FamixTImport opposite: #importedEntity'
	],
	#category : 'Famix-Traits-Import',
	#package : 'Famix-Traits',
	#tag : 'Import'
}

{ #category : 'meta' }
FamixTImportable classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TImportable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTImportable >> addIncomingImport: anObject [

	<ignoreForCoverage>
	<generated>
	^ self incomingImports add: anObject
]

{ #category : 'accessing' }
FamixTImportable >> incomingImports [
	"Relation named: #incomingImports type: #FamixTImport opposite: #importedEntity"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'List of imports of this entity'>
	<derived>
	^ incomingImports
]

{ #category : 'accessing' }
FamixTImportable >> incomingImports: anObject [

	<ignoreForCoverage>
	<generated>
	incomingImports value: anObject
]
