"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingClassSessions` | `FamixTest4TTeacher` | `teacher` | `FamixTest4ClassSession` | |



"
Trait {
	#name : 'FamixTest4TTeacher',
	#instVars : [
		'#outgoingClassSessions => FMMany type: #FamixTest4ClassSession opposite: #teacher'
	],
	#category : 'Famix-Test4-Entities-Traits',
	#package : 'Famix-Test4-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixTest4TTeacher classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTeacher super: #Object>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixTest4TTeacher >> addOutgoingClassSession: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingClassSessions add: anObject
]

{ #category : 'accessing' }
FamixTest4TTeacher >> outgoingClassSessions [
	"Relation named: #outgoingClassSessions type: #FamixTest4ClassSession opposite: #teacher"

	<ignoreForCoverage>
	<generated>
	^ outgoingClassSessions
]

{ #category : 'accessing' }
FamixTest4TTeacher >> outgoingClassSessions: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingClassSessions value: anObject
]
