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
