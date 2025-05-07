"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traits` | `FamixTWithTraits` | `traitOwner` | `FamixTTrait` | |



"
Trait {
	#name : #FamixTWithTraits,
	#instVars : [
		'#traits => FMMany type: #FamixTTrait opposite: #traitOwner'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTWithTraits classSide >> annotation [

	<FMClass: #TWithTraits super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithTraits >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithTraits: self
]

{ #category : #accessing }
FamixTWithTraits >> addTrait: anObject [
	traits add: anObject

]

{ #category : #accessing }
FamixTWithTraits >> traits [
	"Relation named: #traits type: #FamixTTrait opposite: #traitOwner"

	<generated>
	<derived>
	^ traits
]

{ #category : #accessing }
FamixTWithTraits >> traits: anObject [

	<generated>
	traits value: anObject
]
