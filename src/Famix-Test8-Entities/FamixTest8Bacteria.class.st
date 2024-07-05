"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingInfections` | `FamixTest8TInfectable` | `infectable` | `FamixTest8Infection` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `pathogenicity` | `Number` | nil | |

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
