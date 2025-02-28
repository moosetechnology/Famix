"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingImports` | `FamixTImportable` | `importedEntity` | `FamixTImport` | List of imports of this entity|



"
Trait {
	#name : #FamixTImportable,
	#instVars : [
		'#incomingImports => FMMany type: #FamixTImport opposite: #importedEntity'
	],
	#category : #'Famix-Traits-Import'
}

{ #category : #meta }
FamixTImportable classSide >> annotation [

	<FMClass: #TImportable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTImportable >> addIncomingImport: anObject [
	<generated>
	^ self incomingImports add: anObject
]

{ #category : #accessing }
FamixTImportable >> incomingImports [
	"Relation named: #incomingImports type: #FamixTImport opposite: #importedEntity"

	<generated>
	<FMComment: 'List of imports of this entity'>
	<derived>
	^ incomingImports
]

{ #category : #accessing }
FamixTImportable >> incomingImports: anObject [

	<generated>
	incomingImports value: anObject
]
