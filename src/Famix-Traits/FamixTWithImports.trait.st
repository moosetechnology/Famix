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
FamixTWithImports >> addImport: anObject [
	<generated>
	^ self imports add: anObject
]

{ #category : #'as yet unclassified' }
FamixTWithImports >> addOutgoingImport: anObject [

	self
		deprecated: 'Use #addImport:'
		transformWith:
		'`@receiver addOutgoingImport: `@argument' -> '`@receiver addImport: `@argument'.

	^ self addImport: anObject
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

{ #category : #'as yet unclassified' }
FamixTWithImports >> outgoingImports [

	self
		deprecated: 'Use #imports'
		transformWith:
		'`@receiver outgoingImports' -> '`@receiver imports'.

	^ self imports
]

{ #category : #'as yet unclassified' }
FamixTWithImports >> outgoingImports: anObject [

	self
		deprecated: 'Use #imports:'
		transformWith:
		'`@receiver outgoingImports: `@argument' -> '`@receiver imports: `@argument'.

	^ self imports: anObject
]
