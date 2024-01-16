"
## Relations
======================

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `outgoingResidences` | `FamixTest8Residence` | `resident` | |



"
Class {
	#name : #FamixTest8LivingBeing,
	#superclass : #FamixTest8Entity,
	#traits : 'FamixTest8TResident',
	#classTraits : 'FamixTest8TResident classTrait',
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8LivingBeing class >> annotation [

	<FMClass: #LivingBeing super: #FamixTest8Entity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]
