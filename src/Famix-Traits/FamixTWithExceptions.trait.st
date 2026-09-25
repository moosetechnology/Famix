"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `caughtExceptions` | `FamixTWithExceptions` | `catchingEntities` | `FamixTThrowable` | The exceptions caught by the method|
| `declaredExceptions` | `FamixTWithExceptions` | `declaringEntities` | `FamixTThrowable` | The exceptions declared by the method|
| `thrownExceptions` | `FamixTWithExceptions` | `throwingEntities` | `FamixTThrowable` | The exceptions thrown by the method|



"
Trait {
	#name : 'FamixTWithExceptions',
	#instVars : [
		'#caughtExceptions => FMMany type: #FamixTThrowable opposite: #catchingEntities',
		'#declaredExceptions => FMMany type: #FamixTThrowable opposite: #declaringEntities',
		'#thrownExceptions => FMMany type: #FamixTThrowable opposite: #throwingEntities'
	],
	#category : 'Famix-Traits-Exception',
	#package : 'Famix-Traits',
	#tag : 'Exception'
}

{ #category : 'meta' }
FamixTWithExceptions classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithExceptions super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTWithExceptions >> addCaughtException: anObject [

	<ignoreForCoverage>
	<generated>
	^ self caughtExceptions add: anObject
]

{ #category : 'adding' }
FamixTWithExceptions >> addDeclaredException: anObject [

	<ignoreForCoverage>
	<generated>
	^ self declaredExceptions add: anObject
]

{ #category : 'adding' }
FamixTWithExceptions >> addThrownException: anObject [

	<ignoreForCoverage>
	<generated>
	^ self thrownExceptions add: anObject
]

{ #category : 'accessing' }
FamixTWithExceptions >> allExceptions [

	<derived>
	<FMComment: 'The exceptions caught, declared or thrown by the method'>
	^ (caughtExceptions , declaredExceptions , thrownExceptions)
		  asMooseGroup
]

{ #category : 'accessing' }
FamixTWithExceptions >> caughtExceptions [
	"Relation named: #caughtExceptions type: #FamixTThrowable opposite: #catchingEntities"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The exceptions caught by the method'>
	^ caughtExceptions
]

{ #category : 'accessing' }
FamixTWithExceptions >> caughtExceptions: anObject [

	<ignoreForCoverage>
	<generated>
	caughtExceptions value: anObject
]

{ #category : 'accessing' }
FamixTWithExceptions >> declaredExceptions [
	"Relation named: #declaredExceptions type: #FamixTThrowable opposite: #declaringEntities"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The exceptions declared by the method'>
	^ declaredExceptions
]

{ #category : 'accessing' }
FamixTWithExceptions >> declaredExceptions: anObject [

	<ignoreForCoverage>
	<generated>
	declaredExceptions value: anObject
]

{ #category : 'accessing' }
FamixTWithExceptions >> thrownExceptions [
	"Relation named: #thrownExceptions type: #FamixTThrowable opposite: #throwingEntities"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The exceptions thrown by the method'>
	^ thrownExceptions
]

{ #category : 'accessing' }
FamixTWithExceptions >> thrownExceptions: anObject [

	<ignoreForCoverage>
	<generated>
	thrownExceptions value: anObject
]
