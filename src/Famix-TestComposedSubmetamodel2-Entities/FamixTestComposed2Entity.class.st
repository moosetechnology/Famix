Class {
	#name : #FamixTestComposed2Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTestComposed2Entity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed2Entity
]

{ #category : #meta }
FamixTestComposed2Entity class >> metamodel [

	<generated>
	^ FamixTestComposed2Model metamodel
]

{ #category : #testing }
FamixTestComposed2Entity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isComment [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isQueryable [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isType [

	<generated>
	^ false
]
