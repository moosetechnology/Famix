"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traitUsages` | `FamixTTraitUser` | `user` | `FamixTTraitUsage` | |



"
Trait {
	#name : 'FamixTTraitUser',
	#instVars : [
		'#traitUsages => FMMany type: #FamixTTraitUsage opposite: #user'
	],
	#category : 'Famix-Traits-Trait',
	#package : 'Famix-Traits',
	#tag : 'Trait'
}

{ #category : 'meta' }
FamixTTraitUser classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTraitUser super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTTraitUser >> addTraitUsage: anObject [

	<ignoreForCoverage>
	<generated>
	^ self traitUsages add: anObject
]

{ #category : 'accessing' }
FamixTTraitUser >> traitUsages [
	"Relation named: #traitUsages type: #FamixTTraitUsage opposite: #user"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ traitUsages
]

{ #category : 'accessing' }
FamixTTraitUser >> traitUsages: anObject [

	<ignoreForCoverage>
	<generated>
	traitUsages value: anObject
]
