"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingClassSessions` | `FamixTest3TClassroom` | `classroom` | `FamixTest3ClassSession` | |



"
Trait {
	#name : 'FamixTest3TClassroom',
	#instVars : [
		'#incomingClassSessions => FMMany type: #FamixTest3ClassSession opposite: #classroom'
	],
	#category : 'Famix-Test3-Entities-Traits',
	#package : 'Famix-Test3-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixTest3TClassroom classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TClassroom super: #Object>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixTest3TClassroom >> addIncomingClassSession: anObject [

	<ignoreForCoverage>
	<generated>
	^ self incomingClassSessions add: anObject
]

{ #category : 'accessing' }
FamixTest3TClassroom >> incomingClassSessions [
	"Relation named: #incomingClassSessions type: #FamixTest3ClassSession opposite: #classroom"

	<ignoreForCoverage>
	<generated>
	^ incomingClassSessions
]

{ #category : 'accessing' }
FamixTest3TClassroom >> incomingClassSessions: anObject [

	<ignoreForCoverage>
	<generated>
	incomingClassSessions value: anObject
]
