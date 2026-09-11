"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `school` | `FamixTest4Student` | `students` | `FamixTest4School` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `teachers` | `FamixTest4Student` | `students` | `FamixTest4Teacher` | |



"
Class {
	#name : 'FamixTest4Student',
	#superclass : 'FamixTest4Person',
	#instVars : [
		'#school => FMOne type: #FamixTest4School opposite: #students',
		'#teachers => FMMany type: #FamixTest4Teacher opposite: #students'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4Student class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Student super: #FamixTest4Person>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixTest4Student >> addTeacher: anObject [

	<ignoreForCoverage>
	<generated>
	^ self teachers add: anObject
]

{ #category : 'accessing' }
FamixTest4Student >> school [
	"Relation named: #school type: #FamixTest4School opposite: #students"

	<ignoreForCoverage>
	<generated>
	<container>
	^ school
]

{ #category : 'accessing' }
FamixTest4Student >> school: anObject [

	<ignoreForCoverage>
	<generated>
	school := anObject
]

{ #category : 'accessing' }
FamixTest4Student >> teachers [
	"Relation named: #teachers type: #FamixTest4Teacher opposite: #students"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ teachers
]

{ #category : 'accessing' }
FamixTest4Student >> teachers: anObject [

	<ignoreForCoverage>
	<generated>
	teachers value: anObject
]
