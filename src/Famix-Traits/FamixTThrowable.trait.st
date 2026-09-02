"
TThrowable represents all types of possible exceptions.

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchingEntities` | `FamixTThrowable` | `caughtExceptions` | `FamixTWithExceptions` | |
| `declaringEntities` | `FamixTThrowable` | `declaredExceptions` | `FamixTWithExceptions` | |
| `throwingEntities` | `FamixTThrowable` | `thrownExceptions` | `FamixTWithExceptions` | |



"
Trait {
	#name : 'FamixTThrowable',
	#instVars : [
		'#catchingEntities => FMMany type: #FamixTWithExceptions opposite: #caughtExceptions',
		'#declaringEntities => FMMany type: #FamixTWithExceptions opposite: #declaredExceptions',
		'#throwingEntities => FMMany type: #FamixTWithExceptions opposite: #thrownExceptions'
	],
	#category : 'Famix-Traits-Exception',
	#package : 'Famix-Traits',
	#tag : 'Exception'
}

{ #category : 'meta' }
FamixTThrowable classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TThrowable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTThrowable >> addCatchingEntity: anObject [

	<ignoreForCoverage>
	<generated>
	^ self catchingEntities add: anObject
]

{ #category : 'adding' }
FamixTThrowable >> addDeclaringEntity: anObject [

	<ignoreForCoverage>
	<generated>
	^ self declaringEntities add: anObject
]

{ #category : 'adding' }
FamixTThrowable >> addThrowingEntity: anObject [

	<ignoreForCoverage>
	<generated>
	^ self throwingEntities add: anObject
]

{ #category : 'accessing' }
FamixTThrowable >> catchingEntities [
	"Relation named: #catchingEntities type: #FamixTWithExceptions opposite: #caughtExceptions"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ catchingEntities
]

{ #category : 'accessing' }
FamixTThrowable >> catchingEntities: anObject [

	<ignoreForCoverage>
	<generated>
	catchingEntities value: anObject
]

{ #category : 'accessing' }
FamixTThrowable >> declaringEntities [
	"Relation named: #declaringEntities type: #FamixTWithExceptions opposite: #declaredExceptions"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ declaringEntities
]

{ #category : 'accessing' }
FamixTThrowable >> declaringEntities: anObject [

	<ignoreForCoverage>
	<generated>
	declaringEntities value: anObject
]

{ #category : 'accessing' }
FamixTThrowable >> throwingEntities [
	"Relation named: #throwingEntities type: #FamixTWithExceptions opposite: #thrownExceptions"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ throwingEntities
]

{ #category : 'accessing' }
FamixTThrowable >> throwingEntities: anObject [

	<ignoreForCoverage>
	<generated>
	throwingEntities value: anObject
]
