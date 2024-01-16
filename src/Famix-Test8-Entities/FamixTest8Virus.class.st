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
	#name : #FamixTest8Virus,
	#superclass : #FamixTest8Entity,
	#traits : 'FamixTest8TInfectable',
	#classTraits : 'FamixTest8TInfectable classTrait',
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Virus class >> annotation [

	<FMClass: #Virus super: #FamixTest8Entity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]
