"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `classroom` | `FamixTest4Computer` | `computer` | `FamixTest4Classroom` | |



"
Class {
	#name : 'FamixTest4Computer',
	#superclass : 'FamixTest4Entity',
	#instVars : [
		'#classroom => FMOne type: #FamixTest4Classroom opposite: #computer'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4Computer class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Computer super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest4Computer >> classroom [
	"Relation named: #classroom type: #FamixTest4Classroom opposite: #computer"

	<ignoreForCoverage>
	<generated>
	<container>
	<derived>
	^ classroom
]

{ #category : 'accessing' }
FamixTest4Computer >> classroom: anObject [

	<ignoreForCoverage>
	<generated>
	classroom := anObject
]
