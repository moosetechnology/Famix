"
## Relations
======================

### Outgoing dependencies
- Relation: #outgoingImports Type: #FamixTImport Opposite: #importingEntity


"
Trait {
	#name : #FamixTWithImports,
	#instVars : [
		'#outgoingImports => FMMany type: #FamixTImport opposite: #importingEntity'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithImports classSide >> annotation [

	<FMClass: #TWithImports super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTWithImports >> addOutgoingImport: anObject [
	<generated>
	^ self outgoingImports add: anObject
]

{ #category : #accessing }
FamixTWithImports >> outgoingImports [
	"Relation named: #outgoingImports type: #FamixTImport opposite: #importingEntity"

	<generated>
	<derived>
	^ outgoingImports
]

{ #category : #accessing }
FamixTWithImports >> outgoingImports: anObject [

	<generated>
	outgoingImports value: anObject
]
