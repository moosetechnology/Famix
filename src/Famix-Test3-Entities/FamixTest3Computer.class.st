"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `classroom` | `FamixTest3Computer` | `computer` | `FamixTest3Classroom` | |



"
Class {
	#name : 'FamixTest3Computer',
	#superclass : 'FamixTest3Entity',
	#instVars : [
		'#classroom => FMOne type: #FamixTest3Classroom opposite: #computer'
	],
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3Computer class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Computer super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest3Computer >> classroom [
	"Relation named: #classroom type: #FamixTest3Classroom opposite: #computer"

	<ignoreForCoverage>
	<generated>
	<container>
	^ classroom
]

{ #category : 'accessing' }
FamixTest3Computer >> classroom: anObject [

	<ignoreForCoverage>
	<generated>
	classroom := anObject
]
