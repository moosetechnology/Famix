"
This entity models a typedef in C.

Instance Variables:
	aliasedType	<ProtoObject | PseudoContext>

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `aliasedType` | `FamixTTypeAlias` | `typeAliases` | `FamixTWithTypeAliases` | Points to the actual type.|



"
Trait {
	#name : 'FamixTTypeAlias',
	#instVars : [
		'#aliasedType => FMOne type: #FamixTWithTypeAliases opposite: #typeAliases'
	],
	#category : 'Famix-Traits-TypeAlias',
	#package : 'Famix-Traits',
	#tag : 'TypeAlias'
}

{ #category : 'meta' }
FamixTTypeAlias classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTypeAlias super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTTypeAlias >> aliasedType [
	"Relation named: #aliasedType type: #FamixTWithTypeAliases opposite: #typeAliases"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Points to the actual type.'>
	^ aliasedType
]

{ #category : 'accessing' }
FamixTTypeAlias >> aliasedType: anObject [

	<ignoreForCoverage>
	<generated>
	aliasedType := anObject
]
