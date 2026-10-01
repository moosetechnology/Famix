"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `school` | `FamixTest3Room` | `rooms` | `FamixTest3School` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `capacity` | `Number` | 12 | |
| `hasWindows` | `Boolean` | true | |
| `purpose` | `String` | '' | |

"
Class {
	#name : 'FamixTest3Room',
	#superclass : 'FamixTest3Entity',
	#instVars : [
		'#capacity => FMProperty defaultValue: 12',
		'#hasWindows => FMProperty defaultValue: true',
		'#purpose => FMProperty defaultValue: \'\'',
		'#school => FMOne type: #FamixTest3School opposite: #rooms'
	],
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3Room class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Room super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest3Room >> capacity [

	<FMProperty: #capacity type: #Number defaultValue: 12>
	<ignoreForCoverage>
	<generated>
	^ capacity ifNil: [ capacity := 12 ]
]

{ #category : 'accessing' }
FamixTest3Room >> capacity: anObject [
	<ignoreForCoverage>
	<generated>
	capacity := anObject
]

{ #category : 'accessing' }
FamixTest3Room >> hasWindows [

	<FMProperty: #hasWindows type: #Boolean defaultValue: true>
	<ignoreForCoverage>
	<generated>
	^ hasWindows ifNil: [ hasWindows := true ]
]

{ #category : 'accessing' }
FamixTest3Room >> hasWindows: anObject [
	<ignoreForCoverage>
	<generated>
	hasWindows := anObject
]

{ #category : 'accessing' }
FamixTest3Room >> purpose [

	<FMProperty: #purpose type: #String defaultValue: ''>
	<ignoreForCoverage>
	<generated>
	^ purpose ifNil: [ purpose := '' ]
]

{ #category : 'accessing' }
FamixTest3Room >> purpose: anObject [
	<ignoreForCoverage>
	<generated>
	purpose := anObject
]

{ #category : 'accessing' }
FamixTest3Room >> school [
	"Relation named: #school type: #FamixTest3School opposite: #rooms"

	<ignoreForCoverage>
	<generated>
	<container>
	^ school
]

{ #category : 'accessing' }
FamixTest3Room >> school: anObject [

	<ignoreForCoverage>
	<generated>
	school := anObject
]
