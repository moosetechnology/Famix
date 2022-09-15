Class {
	#name : #FamixTest7Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest7Entity class >> metamodel [

	<generated>
	^ FamixTest7Model metamodel
]

{ #category : #testing }
FamixTest7Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest7Entity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest7Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest7Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest7Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest7Entity >> isType [

	<generated>
	^ false
]
