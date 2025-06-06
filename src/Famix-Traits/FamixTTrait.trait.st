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
	#name : #FamixTTrait,
	#instVars : [
		'#incomingTraitUsages => FMMany type: #FamixTTraitUsage opposite: #trait',
		'#traitOwner => FMOne type: #FamixTWithTraits opposite: #traits'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTTrait classSide >> annotation [

	<FMClass: #TTrait super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTTrait >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTTrait: self
]

{ #category : #accessing }
FamixTTrait >> addIncomingTraitUsage: anObject [

	incomingTraitUsages add: anObject

]

{ #category : #accessing }
FamixTTrait >> incomingTraitUsages [
	"Relation named: #incomingTraitUsages type: #FamixTTraitUsage opposite: #trait"

	<generated>
	<derived>
	^ incomingTraitUsages
]

{ #category : #accessing }
FamixTTrait >> incomingTraitUsages: anObject [

	<generated>
	incomingTraitUsages value: anObject
]

{ #category : #accessing }
FamixTTrait >> traitOwner [
	"Relation named: #traitOwner type: #FamixTWithTraits opposite: #traits"

	<generated>
	<container>
	^ traitOwner
]

{ #category : #accessing }
FamixTTrait >> traitOwner: anObject [

	<generated>
	traitOwner := anObject
]

{ #category : #navigation }
FamixTTrait >> traitOwnerGroup [
	<generated>
	<navigation: 'TraitOwner'>
	^ MooseSpecializedGroup with: self traitOwner
]
