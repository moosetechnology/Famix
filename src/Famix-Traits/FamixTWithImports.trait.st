"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `imports` | `FamixTWithImports` | `importingEntity` | `FamixTImport` | |



"
Trait {
	#name : #FamixTWithImports,
	#instVars : [
		'#imports => FMMany type: #FamixTImport opposite: #importingEntity'
	],
	#category : #'Famix-Traits-Import'
}

{ #category : #meta }
FamixTWithImports classSide >> annotation [

	<FMClass: #TWithImports super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTWithImports >> addImport: anObject [
	<generated>
	^ self imports add: anObject
]

{ #category : #accessing }
FamixTWithImports >> imports [
	"Relation named: #imports type: #FamixTImport opposite: #importingEntity"

	<generated>
	<derived>
	^ imports
]

{ #category : #accessing }
FamixTWithImports >> imports: anObject [

	<generated>
	imports value: anObject
]
