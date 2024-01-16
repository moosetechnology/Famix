"
## Properties
======================

| Name | Type | Comment |
| `name` | String | |

"
Class {
	#name : #FamixTest4Entity,
	#superclass : #MooseEntity,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest4Entity class >> isAbstract [

	<generated>
	^ self == FamixTest4Entity
]

{ #category : #meta }
FamixTest4Entity class >> metamodel [

	<generated>
	^ FamixTest4Model metamodel
]

{ #category : #accessing }
FamixTest4Entity >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
FamixTest4Entity >> name: anObject [
	<generated>
	name := anObject
]
