"
## Relations
======================

### Outgoing dependencies
- Relation: #outgoingResidences Type: #FamixTest8Residence Opposite: #resident


"
Trait {
	#name : #FamixTest8TResident,
	#instVars : [
		'#outgoingResidences => FMMany type: #FamixTest8Residence opposite: #resident'
	],
	#category : #'Famix-Test8-Entities-Traits'
}

{ #category : #meta }
FamixTest8TResident classSide >> annotation [

	<FMClass: #TResident super: #Object>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTest8TResident >> addOutgoingResidence: anObject [
	<generated>
	^ self outgoingResidences add: anObject
]

{ #category : #accessing }
FamixTest8TResident >> outgoingResidences [
	"Relation named: #outgoingResidences type: #FamixTest8Residence opposite: #resident"

	<generated>
	<derived>
	^ outgoingResidences
]

{ #category : #accessing }
FamixTest8TResident >> outgoingResidences: anObject [

	<generated>
	outgoingResidences value: anObject
]
