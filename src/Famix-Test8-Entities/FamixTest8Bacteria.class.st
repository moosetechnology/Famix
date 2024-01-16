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
Class {
	#name : #FamixTest8Bacteria,
	#superclass : #FamixTest8LivingBeing,
	#traits : 'FamixTest8TInfectable',
	#classTraits : 'FamixTest8TInfectable classTrait',
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Bacteria class >> annotation [

	<FMClass: #Bacteria super: #FamixTest8LivingBeing>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]
