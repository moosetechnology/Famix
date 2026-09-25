"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `school` | `FamixTest4Room` | `rooms` | `FamixTest4School` | |



"
Class {
	#name : 'FamixTest4Room',
	#superclass : 'FamixTest4Entity',
	#instVars : [
		'#school => FMOne type: #FamixTest4School opposite: #rooms'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4Room class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Room super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest4Room >> school [
	"Relation named: #school type: #FamixTest4School opposite: #rooms"

	<ignoreForCoverage>
	<generated>
	<container>
	^ school
]

{ #category : 'accessing' }
FamixTest4Room >> school: anObject [

	<ignoreForCoverage>
	<generated>
	school := anObject
]
