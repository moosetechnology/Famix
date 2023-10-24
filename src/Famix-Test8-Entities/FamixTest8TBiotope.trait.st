Trait {
	#name : #FamixTest8TBiotope,
	#instVars : [
		'#incomingResidences => FMMany type: #FamixTest8Residence opposite: #biotope'
	],
	#category : #'Famix-Test8-Entities-Traits'
}

{ #category : #meta }
FamixTest8TBiotope classSide >> annotation [

	<FMClass: #TBiotope super: #Object>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTest8TBiotope >> addIncomingResidence: anObject [
	<generated>
	^ self incomingResidences add: anObject
]

{ #category : #accessing }
FamixTest8TBiotope >> incomingResidences [
	"Relation named: #incomingResidences type: #FamixTest8Residence opposite: #biotope"

	<generated>
	<derived>
	^ incomingResidences
]

{ #category : #accessing }
FamixTest8TBiotope >> incomingResidences: anObject [

	<generated>
	incomingResidences value: anObject
]
