"
FamixTTrait models a trait as it can be found in Pharo or PHP.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traitOwner` | `FamixTTrait` | `traits` | `FamixTWithTraits` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingTraitUsages` | `FamixTTrait` | `trait` | `FamixTTraitUsage` | |



"
Trait {
	#name : 'FamixTTrait',
	#instVars : [
		'#incomingTraitUsages => FMMany type: #FamixTTraitUsage opposite: #trait',
		'#traitOwner => FMOne type: #FamixTWithTraits opposite: #traits'
	],
	#category : 'Famix-Traits-Trait',
	#package : 'Famix-Traits',
	#tag : 'Trait'
}

{ #category : 'meta' }
FamixTTrait classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTrait super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTTrait >> addIncomingTraitUsage: anObject [

	incomingTraitUsages add: anObject

]

{ #category : 'accessing' }
FamixTTrait >> incomingTraitUsages [
	"Relation named: #incomingTraitUsages type: #FamixTTraitUsage opposite: #trait"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ incomingTraitUsages
]

{ #category : 'accessing' }
FamixTTrait >> incomingTraitUsages: anObject [

	<ignoreForCoverage>
	<generated>
	incomingTraitUsages value: anObject
]

{ #category : 'accessing' }
FamixTTrait >> traitOwner [
	"Relation named: #traitOwner type: #FamixTWithTraits opposite: #traits"

	<ignoreForCoverage>
	<generated>
	<container>
	^ traitOwner
]

{ #category : 'accessing' }
FamixTTrait >> traitOwner: anObject [

	<ignoreForCoverage>
	<generated>
	traitOwner := anObject
]
