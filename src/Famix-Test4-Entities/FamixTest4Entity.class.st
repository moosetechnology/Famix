"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | |

"
Class {
	#name : 'FamixTest4Entity',
	#superclass : 'MooseEntity',
	#instVars : [
		'#name => FMProperty'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4Entity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest4Entity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest4Entity
]

{ #category : 'meta' }
FamixTest4Entity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTest4Model metamodel
]

{ #category : 'accessing' }
FamixTest4Entity >> name [

	<FMProperty: #name type: #String>
	<ignoreForCoverage>
	<generated>
	^ name
]

{ #category : 'accessing' }
FamixTest4Entity >> name: anObject [
	<ignoreForCoverage>
	<generated>
	name := anObject
]
