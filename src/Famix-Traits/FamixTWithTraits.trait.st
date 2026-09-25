"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traits` | `FamixTWithTraits` | `traitOwner` | `FamixTTrait` | |



"
Trait {
	#name : 'FamixTWithTraits',
	#instVars : [
		'#traits => FMMany type: #FamixTTrait opposite: #traitOwner'
	],
	#category : 'Famix-Traits-Trait',
	#package : 'Famix-Traits',
	#tag : 'Trait'
}

{ #category : 'meta' }
FamixTWithTraits classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithTraits super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTWithTraits >> addTrait: anObject [
	traits add: anObject

]

{ #category : 'accessing' }
FamixTWithTraits >> traits [
	"Relation named: #traits type: #FamixTTrait opposite: #traitOwner"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ traits
]

{ #category : 'accessing' }
FamixTWithTraits >> traits: anObject [

	<ignoreForCoverage>
	<generated>
	traits value: anObject
]
