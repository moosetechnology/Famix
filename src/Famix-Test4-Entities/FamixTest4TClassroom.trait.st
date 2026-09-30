"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingClassSessions` | `FamixTest4TClassroom` | `classroom` | `FamixTest4ClassSession` | |



"
Trait {
	#name : 'FamixTest4TClassroom',
	#instVars : [
		'#incomingClassSessions => FMMany type: #FamixTest4ClassSession opposite: #classroom'
	],
	#category : 'Famix-Test4-Entities-Traits',
	#package : 'Famix-Test4-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixTest4TClassroom classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TClassroom super: #Object>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixTest4TClassroom >> addIncomingClassSession: anObject [

	<ignoreForCoverage>
	<generated>
	^ self incomingClassSessions add: anObject
]

{ #category : 'accessing' }
FamixTest4TClassroom >> incomingClassSessions [
	"Relation named: #incomingClassSessions type: #FamixTest4ClassSession opposite: #classroom"

	<ignoreForCoverage>
	<generated>
	^ incomingClassSessions
]

{ #category : 'accessing' }
FamixTest4TClassroom >> incomingClassSessions: anObject [

	<ignoreForCoverage>
	<generated>
	incomingClassSessions value: anObject
]
