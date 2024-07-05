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
	#name : #FamixTThrowable,
	#instVars : [
		'#catchingEntities => FMMany type: #FamixTWithExceptions opposite: #caughtExceptions',
		'#declaringEntities => FMMany type: #FamixTWithExceptions opposite: #declaredExceptions',
		'#throwingEntities => FMMany type: #FamixTWithExceptions opposite: #thrownExceptions'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTThrowable classSide >> annotation [

	<FMClass: #TThrowable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTThrowable >> addCatchingEntity: anObject [
	<generated>
	^ self catchingEntities add: anObject
]

{ #category : #adding }
FamixTThrowable >> addDeclaringEntity: anObject [
	<generated>
	^ self declaringEntities add: anObject
]

{ #category : #adding }
FamixTThrowable >> addThrowingEntity: anObject [
	<generated>
	^ self throwingEntities add: anObject
]

{ #category : #accessing }
FamixTThrowable >> catchingEntities [
	"Relation named: #catchingEntities type: #FamixTWithExceptions opposite: #caughtExceptions"

	<generated>
	<derived>
	^ catchingEntities
]

{ #category : #accessing }
FamixTThrowable >> catchingEntities: anObject [

	<generated>
	catchingEntities value: anObject
]

{ #category : #accessing }
FamixTThrowable >> declaringEntities [
	"Relation named: #declaringEntities type: #FamixTWithExceptions opposite: #declaredExceptions"

	<generated>
	<derived>
	^ declaringEntities
]

{ #category : #accessing }
FamixTThrowable >> declaringEntities: anObject [

	<generated>
	declaringEntities value: anObject
]

{ #category : #accessing }
FamixTThrowable >> throwingEntities [
	"Relation named: #throwingEntities type: #FamixTWithExceptions opposite: #thrownExceptions"

	<generated>
	<derived>
	^ throwingEntities
]

{ #category : #accessing }
FamixTThrowable >> throwingEntities: anObject [

	<generated>
	throwingEntities value: anObject
]
