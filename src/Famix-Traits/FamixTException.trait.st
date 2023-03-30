"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FamixTException is a normal FamixTClass.
"
Trait {
	#name : #FamixTException,
	#instVars : [
		'#catchingEntities => FMMany type: #FamixTWithExceptions opposite: #caughtExceptions',
		'#declaringEntities => FMMany type: #FamixTWithExceptions opposite: #declaredExceptions',
		'#throwingEntities => FMMany type: #FamixTWithExceptions opposite: #thrownExceptions'
	],
	#traits : 'FamixTClass',
	#classTraits : 'FamixTClass classTrait',
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTException classSide >> annotation [

	<FMClass: #TException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTException >> addCatchingEntity: anObject [
	<generated>
	^ self catchingEntities add: anObject
]

{ #category : #adding }
FamixTException >> addDeclaringEntity: anObject [
	<generated>
	^ self declaringEntities add: anObject
]

{ #category : #adding }
FamixTException >> addThrowingEntity: anObject [
	<generated>
	^ self throwingEntities add: anObject
]

{ #category : #accessing }
FamixTException >> catchingEntities [
	"Relation named: #catchingEntities type: #FamixTWithExceptions opposite: #caughtExceptions"

	<generated>
	<derived>
	^ catchingEntities
]

{ #category : #accessing }
FamixTException >> catchingEntities: anObject [

	<generated>
	catchingEntities value: anObject
]

{ #category : #accessing }
FamixTException >> declaringEntities [
	"Relation named: #declaringEntities type: #FamixTWithExceptions opposite: #declaredExceptions"

	<generated>
	<derived>
	^ declaringEntities
]

{ #category : #accessing }
FamixTException >> declaringEntities: anObject [

	<generated>
	declaringEntities value: anObject
]

{ #category : #testing }
FamixTException >> isException [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTException >> throwingEntities [
	"Relation named: #throwingEntities type: #FamixTWithExceptions opposite: #thrownExceptions"

	<generated>
	<derived>
	^ throwingEntities
]

{ #category : #accessing }
FamixTException >> throwingEntities: anObject [

	<generated>
	throwingEntities value: anObject
]
