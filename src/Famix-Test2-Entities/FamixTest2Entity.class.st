Class {
	#name : #FamixTest2Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest2Entity class >> isAbstract [

	<generated>
	^ self == FamixTest2Entity
]

{ #category : #meta }
FamixTest2Entity class >> metamodel [

	<generated>
	^ FamixTest2Model metamodel
]

{ #category : #testing }
FamixTest2Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isComment [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isQueryable [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isType [

	<generated>
	^ false
]
