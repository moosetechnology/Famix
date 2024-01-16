"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
| `incomingInfections` | `FamixTest8TInfectious` | `infectious` | `FamixTest8Infection` | |



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
