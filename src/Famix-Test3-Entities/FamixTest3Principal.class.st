"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `school` | `FamixTest3Principal` | `principal` | `FamixTest3School` | |



"
Class {
	#name : 'FamixTest3Principal',
	#superclass : 'FamixTest3Person',
	#instVars : [
		'#school => FMOne type: #FamixTest3School opposite: #principal'
	],
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3Principal class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Principal super: #FamixTest3Person>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest3Principal >> school [
	"Relation named: #school type: #FamixTest3School opposite: #principal"

	<ignoreForCoverage>
	<generated>
	<container>
	^ school
]

{ #category : 'accessing' }
FamixTest3Principal >> school: anObject [

	<ignoreForCoverage>
	<generated>
	school := anObject
]
