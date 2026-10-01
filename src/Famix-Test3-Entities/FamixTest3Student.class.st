"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `school` | `FamixTest3Student` | `students` | `FamixTest3School` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `teachers` | `FamixTest3Student` | `students` | `FamixTest3Teacher` | |



"
Class {
	#name : #FamixTest3Student,
	#superclass : #FamixTest3Person,
	#instVars : [
		'#school => FMOne type: #FamixTest3School opposite: #students',
		'#teachers => FMMany type: #FamixTest3Teacher opposite: #students'
	],
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Student class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Student super: #FamixTest3Person>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #adding }
FamixTest3Student >> addTeacher: anObject [

	<ignoreForCoverage>
	<generated>
	^ self teachers add: anObject
]

{ #category : #accessing }
FamixTest3Student >> school [
	"Relation named: #school type: #FamixTest3School opposite: #students"

	<ignoreForCoverage>
	<generated>
	<container>
	^ school
]

{ #category : #accessing }
FamixTest3Student >> school: anObject [

	<ignoreForCoverage>
	<generated>
	school := anObject
]

{ #category : #accessing }
FamixTest3Student >> teachers [
	"Relation named: #teachers type: #FamixTest3Teacher opposite: #students"

	<ignoreForCoverage>
	<generated>
	^ teachers
]

{ #category : #accessing }
FamixTest3Student >> teachers: anObject [

	<ignoreForCoverage>
	<generated>
	teachers value: anObject
]
