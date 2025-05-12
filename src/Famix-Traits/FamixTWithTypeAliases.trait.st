"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeAliases` | `FamixTWithTypeAliases` | `aliasedType` | `FamixTTypeAlias` | Aliases|



"
Trait {
	#name : #FamixTWithTypeAliases,
	#instVars : [
		'#typeAliases => FMMany type: #FamixTTypeAlias opposite: #aliasedType'
	],
	#category : #'Famix-Traits-TypeAlias'
}

{ #category : #meta }
FamixTWithTypeAliases classSide >> annotation [

	<FMClass: #TWithTypeAliases super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithTypeAliases >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithTypeAliases: self
]

{ #category : #accessing }
FamixTWithTypeAliases >> addTypeAlias: anObject [
	typeAliases add: anObject

]

{ #category : #adding }
FamixTWithTypeAliases >> addTypeAliase: anObject [
	<generated>
	^ self typeAliases add: anObject
]

{ #category : #accessing }
FamixTWithTypeAliases >> allTypeAliases [
	| all |
	all := OrderedCollection withAll: self typeAliases.
	self typeAliases do: [:each | all addAll: each allTypeAliases ].
	^ all
]

{ #category : #accessing }
FamixTWithTypeAliases >> typeAliases [
	"Relation named: #typeAliases type: #FamixTTypeAlias opposite: #aliasedType"

	<generated>
	<FMComment: 'Aliases'>
	<derived>
	^ typeAliases
]

{ #category : #accessing }
FamixTWithTypeAliases >> typeAliases: anObject [

	<generated>
	typeAliases value: anObject
]
