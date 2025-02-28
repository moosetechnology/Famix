"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traitUsages` | `FamixTTraitUser` | `user` | `FamixTTraitUsage` | |



"
Trait {
	#name : #FamixTTraitUser,
	#instVars : [
		'#traitUsages => FMMany type: #FamixTTraitUsage opposite: #user'
	],
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTTraitUser classSide >> annotation [

	<FMClass: #TTraitUser super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTTraitUser >> addTraitUsage: anObject [
	<generated>
	^ self traitUsages add: anObject
]

{ #category : #accessing }
FamixTTraitUser >> traitUsages [
	"Relation named: #traitUsages type: #FamixTTraitUsage opposite: #user"

	<generated>
	<derived>
	^ traitUsages
]

{ #category : #accessing }
FamixTTraitUser >> traitUsages: anObject [

	<generated>
	traitUsages value: anObject
]
