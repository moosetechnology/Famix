"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `principal` | `FamixTest4School` | `school` | `FamixTest4Principal` | |
| `rooms` | `FamixTest4School` | `school` | `FamixTest4Room` | |
| `students` | `FamixTest4School` | `school` | `FamixTest4Student` | |
| `teachers` | `FamixTest4School` | `school` | `FamixTest4Teacher` | |



"
Class {
	#name : 'FamixTest4School',
	#superclass : 'FamixTest4Entity',
	#instVars : [
		'#principal => FMOne type: #FamixTest4Principal opposite: #school',
		'#students => FMMany type: #FamixTest4Student opposite: #school',
		'#teachers => FMMany type: #FamixTest4Teacher opposite: #school',
		'#rooms => FMMany type: #FamixTest4Room opposite: #school'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4School class >> annotation [

	<ignoreForCoverage>
	<FMClass: #School super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixTest4School >> addRoom: anObject [

	<ignoreForCoverage>
	<generated>
	^ self rooms add: anObject
]

{ #category : 'adding' }
FamixTest4School >> addStudent: anObject [

	<ignoreForCoverage>
	<generated>
	^ self students add: anObject
]

{ #category : 'adding' }
FamixTest4School >> addTeacher: anObject [

	<ignoreForCoverage>
	<generated>
	^ self teachers add: anObject
]

{ #category : 'accessing' }
FamixTest4School >> principal [
	"Relation named: #principal type: #FamixTest4Principal opposite: #school"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ principal
]

{ #category : 'accessing' }
FamixTest4School >> principal: anObject [

	<ignoreForCoverage>
	<generated>
	principal := anObject
]

{ #category : 'accessing' }
FamixTest4School >> rooms [
	"Relation named: #rooms type: #FamixTest4Room opposite: #school"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ rooms
]

{ #category : 'accessing' }
FamixTest4School >> rooms: anObject [

	<ignoreForCoverage>
	<generated>
	rooms value: anObject
]

{ #category : 'accessing' }
FamixTest4School >> students [
	"Relation named: #students type: #FamixTest4Student opposite: #school"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ students
]

{ #category : 'accessing' }
FamixTest4School >> students: anObject [

	<ignoreForCoverage>
	<generated>
	students value: anObject
]

{ #category : 'accessing' }
FamixTest4School >> teachers [
	"Relation named: #teachers type: #FamixTest4Teacher opposite: #school"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ teachers
]

{ #category : 'accessing' }
FamixTest4School >> teachers: anObject [

	<ignoreForCoverage>
	<generated>
	teachers value: anObject
]
