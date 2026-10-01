"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `school` | `FamixTest3Teacher` | `teachers` | `FamixTest3School` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingClassSessions` | `FamixTest3TTeacher` | `teacher` | `FamixTest3ClassSession` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `students` | `FamixTest3Teacher` | `teachers` | `FamixTest3Student` | |



"
Class {
	#name : #FamixTest3Teacher,
	#superclass : #FamixTest3Person,
	#traits : 'FamixTest3TTeacher',
	#classTraits : 'FamixTest3TTeacher classTrait',
	#instVars : [
		'#school => FMOne type: #FamixTest3School opposite: #teachers',
		'#students => FMMany type: #FamixTest3Student opposite: #teachers'
	],
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Teacher class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Teacher super: #FamixTest3Person>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #adding }
FamixTest3Teacher >> addStudent: anObject [

	<ignoreForCoverage>
	<generated>
	^ self students add: anObject
]

{ #category : #accessing }
FamixTest3Teacher >> school [
	"Relation named: #school type: #FamixTest3School opposite: #teachers"

	<ignoreForCoverage>
	<generated>
	<container>
	^ school
]

{ #category : #accessing }
FamixTest3Teacher >> school: anObject [

	<ignoreForCoverage>
	<generated>
	school := anObject
]

{ #category : #accessing }
FamixTest3Teacher >> students [
	"Relation named: #students type: #FamixTest3Student opposite: #teachers"

	<ignoreForCoverage>
	<generated>
	^ students
]

{ #category : #accessing }
FamixTest3Teacher >> students: anObject [

	<ignoreForCoverage>
	<generated>
	students value: anObject
]
