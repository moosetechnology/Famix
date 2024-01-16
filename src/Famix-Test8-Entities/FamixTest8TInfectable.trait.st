"
## Relations
======================

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `outgoingInfections` | `FamixTest8Infection` | `infectable` | |


## Properties
======================

| Name | Type | Comment |
| `pathogenicity` | Number | |

"
Trait {
	#name : #FamixTest8TInfectable,
	#instVars : [
		'#outgoingInfections => FMMany type: #FamixTest8Infection opposite: #infectable',
		'#pathogenicity => FMProperty'
	],
	#category : #'Famix-Test8-Entities-Traits'
}

{ #category : #meta }
FamixTest8TInfectable classSide >> annotation [

	<FMClass: #TInfectable super: #Object>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTest8TInfectable >> addOutgoingInfection: anObject [
	<generated>
	^ self outgoingInfections add: anObject
]

{ #category : #accessing }
FamixTest8TInfectable >> outgoingInfections [
	"Relation named: #outgoingInfections type: #FamixTest8Infection opposite: #infectable"

	<generated>
	<derived>
	^ outgoingInfections
]

{ #category : #accessing }
FamixTest8TInfectable >> outgoingInfections: anObject [

	<generated>
	outgoingInfections value: anObject
]

{ #category : #accessing }
FamixTest8TInfectable >> pathogenicity [

	<FMProperty: #pathogenicity type: #Number>
	<generated>
	^ pathogenicity
]

{ #category : #accessing }
FamixTest8TInfectable >> pathogenicity: anObject [
	<generated>
	pathogenicity := anObject
]
