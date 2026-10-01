"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | |

"
Class {
	#name : #FamixTest3Entity,
	#superclass : #MooseEntity,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Entity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	<abstract>
]

{ #category : #testing }
FamixTest3Entity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest3Entity
]

{ #category : #meta }
FamixTest3Entity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTest3Model metamodel
]

{ #category : #testing }
FamixTest3Entity >> isAssociation [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isComment [

	<generated>
	^ false
]

{ #category : #accessing }
FamixTest3Entity >> name [

	<FMProperty: #name type: #String>
	<ignoreForCoverage>
	<generated>
	^ name
]

{ #category : #accessing }
FamixTest3Entity >> name: anObject [
	<ignoreForCoverage>
	<generated>
	name := anObject
]
