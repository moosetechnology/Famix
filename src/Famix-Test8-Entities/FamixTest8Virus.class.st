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
