Class {
	#name : #FamixTestComposed1Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTestComposed1Entity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed1Entity
]

{ #category : #meta }
FamixTestComposed1Entity class >> metamodel [

	<generated>
	^ FamixTestComposed1Model metamodel
]

{ #category : #testing }
FamixTestComposed1Entity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isType [

	<generated>
	^ false
]
