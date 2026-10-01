"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingClassSessions` | `FamixTest3TTeacher` | `teacher` | `FamixTest3ClassSession` | |



"
Trait {
	#name : #FamixTest3TTeacher,
	#instVars : [
		'#outgoingClassSessions => FMMany type: #FamixTest3ClassSession opposite: #teacher'
	],
	#category : #'Famix-Test3-Entities-Traits'
}

{ #category : #meta }
FamixTest3TTeacher classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTeacher super: #Object>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #adding }
FamixTest3TTeacher >> addOutgoingClassSession: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingClassSessions add: anObject
]

{ #category : #accessing }
FamixTest3TTeacher >> outgoingClassSessions [
	"Relation named: #outgoingClassSessions type: #FamixTest3ClassSession opposite: #teacher"

	<ignoreForCoverage>
	<generated>
	^ outgoingClassSessions
]

{ #category : #accessing }
FamixTest3TTeacher >> outgoingClassSessions: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingClassSessions value: anObject
]
