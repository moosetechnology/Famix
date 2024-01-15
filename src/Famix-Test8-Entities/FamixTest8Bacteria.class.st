"
## Relations
======================

### Outgoing dependencies
- Relation: #outgoingInfections Type: #FamixTest8Infection Opposite: #infectable

## Properties
======================

- Named: #pathogenicity Type: Number

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
