"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingResidences` | `FamixTest8TBiotope` | `biotope` | `FamixTest8Residence` | |



"
Trait {
	#name : 'FamixTest8TBiotope',
	#instVars : [
		'#incomingResidences => FMMany type: #FamixTest8Residence opposite: #biotope'
	],
	#category : 'Famix-Test8-Entities-Traits',
	#package : 'Famix-Test8-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixTest8TBiotope classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TBiotope super: #Object>
	<package: #'Famix-Test8-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixTest8TBiotope >> addIncomingResidence: anObject [

	<ignoreForCoverage>
	<generated>
	^ self incomingResidences add: anObject
]

{ #category : 'accessing' }
FamixTest8TBiotope >> incomingResidences [
	"Relation named: #incomingResidences type: #FamixTest8Residence opposite: #biotope"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ incomingResidences
]

{ #category : 'accessing' }
FamixTest8TBiotope >> incomingResidences: anObject [

	<ignoreForCoverage>
	<generated>
	incomingResidences value: anObject
]
