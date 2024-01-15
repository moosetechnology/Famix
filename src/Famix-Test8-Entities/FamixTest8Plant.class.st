"
## Relations
======================

### Incomming dependencies
- Relation: #incomingInfections Type: #FamixTest8Infection Opposite: #infectious


"
Class {
	#name : #FamixTest8Plant,
	#superclass : #FamixTest8LivingBeing,
	#traits : 'FamixTest8TInfectious',
	#classTraits : 'FamixTest8TInfectious classTrait',
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Plant class >> annotation [

	<FMClass: #Plant super: #FamixTest8LivingBeing>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]
