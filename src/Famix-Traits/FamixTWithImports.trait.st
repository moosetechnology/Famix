"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `imports` | `FamixTWithImports` | `importingEntity` | `FamixTImport` | |



"
Trait {
	#name : 'FamixTWithImports',
	#instVars : [
		'#imports => FMMany type: #FamixTImport opposite: #importingEntity'
	],
	#category : 'Famix-Traits-Import',
	#package : 'Famix-Traits',
	#tag : 'Import'
}

{ #category : 'meta' }
FamixTWithImports classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithImports super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTWithImports >> addImport: anObject [

	<ignoreForCoverage>
	<generated>
	^ self imports add: anObject
]

{ #category : 'accessing' }
FamixTWithImports >> imports [
	"Relation named: #imports type: #FamixTImport opposite: #importingEntity"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ imports
]

{ #category : 'accessing' }
FamixTWithImports >> imports: anObject [

	<ignoreForCoverage>
	<generated>
	imports value: anObject
]
