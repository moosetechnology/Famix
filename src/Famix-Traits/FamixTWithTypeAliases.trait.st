"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeAliases` | `FamixTWithTypeAliases` | `aliasedType` | `FamixTTypeAlias` | Aliases|



"
Trait {
	#name : 'FamixTWithTypeAliases',
	#instVars : [
		'#typeAliases => FMMany type: #FamixTTypeAlias opposite: #aliasedType'
	],
	#category : 'Famix-Traits-TypeAlias',
	#package : 'Famix-Traits',
	#tag : 'TypeAlias'
}

{ #category : 'meta' }
FamixTWithTypeAliases classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithTypeAliases super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTWithTypeAliases >> addTypeAlias: anObject [

	<ignoreForCoverage>
	<generated>
	^ self typeAliases add: anObject
]

{ #category : 'accessing' }
FamixTWithTypeAliases >> allTypeAliases [
	| all |
	all := OrderedCollection withAll: self typeAliases.
	self typeAliases do: [:each | all addAll: each allTypeAliases ].
	^ all
]

{ #category : 'accessing' }
FamixTWithTypeAliases >> typeAliases [
	"Relation named: #typeAliases type: #FamixTTypeAlias opposite: #aliasedType"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Aliases'>
	<derived>
	^ typeAliases
]

{ #category : 'accessing' }
FamixTWithTypeAliases >> typeAliases: anObject [

	<ignoreForCoverage>
	<generated>
	typeAliases value: anObject
]
