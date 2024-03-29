"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingResidences` | `FamixTest8TBiotope` | `biotope` | `FamixTest8Residence` | |



"
Class {
	#name : #FamixTest8Biotope,
	#superclass : #FamixTest8Entity,
	#traits : 'FamixTest8TBiotope',
	#classTraits : 'FamixTest8TBiotope classTrait',
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Biotope class >> annotation [

	<FMClass: #Biotope super: #FamixTest8Entity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]
