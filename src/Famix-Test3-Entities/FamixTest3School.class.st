"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `principal` | `FamixTest3School` | `school` | `FamixTest3Principal` | |
| `rooms` | `FamixTest3School` | `school` | `FamixTest3Room` | |
| `students` | `FamixTest3School` | `school` | `FamixTest3Student` | |
| `teachers` | `FamixTest3School` | `school` | `FamixTest3Teacher` | |



"
Class {
	#name : #FamixTest3School,
	#superclass : #FamixTest3Entity,
	#instVars : [
		'#principal => FMOne type: #FamixTest3Principal opposite: #school',
		'#students => FMMany type: #FamixTest3Student opposite: #school',
		'#teachers => FMMany type: #FamixTest3Teacher opposite: #school',
		'#rooms => FMMany type: #FamixTest3Room opposite: #school'
	],
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3School class >> annotation [

	<ignoreForCoverage>
	<FMClass: #School super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #adding }
FamixTest3School >> addRoom: anObject [

	<ignoreForCoverage>
	<generated>
	^ self rooms add: anObject
]

{ #category : #adding }
FamixTest3School >> addStudent: anObject [

	<ignoreForCoverage>
	<generated>
	^ self students add: anObject
]

{ #category : #adding }
FamixTest3School >> addTeacher: anObject [

	<ignoreForCoverage>
	<generated>
	^ self teachers add: anObject
]

{ #category : #accessing }
FamixTest3School >> principal [
	"Relation named: #principal type: #FamixTest3Principal opposite: #school"

	<ignoreForCoverage>
	<generated>
	^ principal
]

{ #category : #accessing }
FamixTest3School >> principal: anObject [

	<ignoreForCoverage>
	<generated>
	principal := anObject
]

{ #category : #accessing }
FamixTest3School >> rooms [
	"Relation named: #rooms type: #FamixTest3Room opposite: #school"

	<ignoreForCoverage>
	<generated>
	^ rooms
]

{ #category : #accessing }
FamixTest3School >> rooms: anObject [

	<ignoreForCoverage>
	<generated>
	rooms value: anObject
]

{ #category : #accessing }
FamixTest3School >> students [
	"Relation named: #students type: #FamixTest3Student opposite: #school"

	<ignoreForCoverage>
	<generated>
	^ students
]

{ #category : #accessing }
FamixTest3School >> students: anObject [

	<ignoreForCoverage>
	<generated>
	students value: anObject
]

{ #category : #accessing }
FamixTest3School >> teachers [
	"Relation named: #teachers type: #FamixTest3Teacher opposite: #school"

	<ignoreForCoverage>
	<generated>
	^ teachers
]

{ #category : #accessing }
FamixTest3School >> teachers: anObject [

	<ignoreForCoverage>
	<generated>
	teachers value: anObject
]
