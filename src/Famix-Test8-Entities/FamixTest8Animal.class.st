"
## Relations
======================

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingInfections` | `FamixTest8Infection` | `infectious` | |



"
Class {
	#name : #FamixTest8Animal,
	#superclass : #FamixTest8LivingBeing,
	#traits : 'FamixTest8TInfectious',
	#classTraits : 'FamixTest8TInfectious classTrait',
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Animal class >> annotation [

	<FMClass: #Animal super: #FamixTest8LivingBeing>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]
