"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingInfections` | `FamixTest8TInfectious` | `infectious` | `FamixTest8Infection` | |



"
Trait {
	#name : #FamixTest8TInfectious,
	#instVars : [
		'#incomingInfections => FMMany type: #FamixTest8Infection opposite: #infectious'
	],
	#category : #'Famix-Test8-Entities-Traits'
}

{ #category : #meta }
FamixTest8TInfectious classSide >> annotation [

	<FMClass: #TInfectious super: #Object>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTest8TInfectious >> addIncomingInfection: anObject [
	<generated>
	^ self incomingInfections add: anObject
]

{ #category : #accessing }
FamixTest8TInfectious >> incomingInfections [
	"Relation named: #incomingInfections type: #FamixTest8Infection opposite: #infectious"

	<generated>
	<derived>
	^ incomingInfections
]

{ #category : #accessing }
FamixTest8TInfectious >> incomingInfections: anObject [

	<generated>
	incomingInfections value: anObject
]
