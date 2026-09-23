"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `school` | `FamixTest4Room` | `rooms` | `FamixTest4School` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `capacity` | `Number` | 12 | |
| `hasWindows` | `Boolean` | true | |
| `purpose` | `String` | '' | |

"
Class {
	#name : 'FamixTest4Room',
	#superclass : 'FamixTest4Entity',
	#instVars : [
		'#capacity => FMProperty defaultValue: 12',
		'#hasWindows => FMProperty defaultValue: true',
		'#purpose => FMProperty defaultValue: \'\'',
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
FamixTest4Room >> capacity [

	<FMProperty: #capacity type: #Number defaultValue: 12>
	<ignoreForCoverage>
	<generated>
	^ capacity ifNil: [ capacity := 12 ]
]

{ #category : 'accessing' }
FamixTest4Room >> capacity: anObject [
	<ignoreForCoverage>
	<generated>
	capacity := anObject
]

{ #category : 'accessing' }
FamixTest4Room >> hasWindows [

	<FMProperty: #hasWindows type: #Boolean defaultValue: true>
	<ignoreForCoverage>
	<generated>
	^ hasWindows ifNil: [ hasWindows := true ]
]

{ #category : 'accessing' }
FamixTest4Room >> hasWindows: anObject [
	<ignoreForCoverage>
	<generated>
	hasWindows := anObject
]

{ #category : 'accessing' }
FamixTest4Room >> purpose [

	<FMProperty: #purpose type: #String defaultValue: ''>
	<ignoreForCoverage>
	<generated>
	^ purpose ifNil: [ purpose := '' ]
]

{ #category : 'accessing' }
FamixTest4Room >> purpose: anObject [
	<ignoreForCoverage>
	<generated>
	purpose := anObject
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
