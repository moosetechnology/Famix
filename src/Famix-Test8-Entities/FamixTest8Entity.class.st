Class {
	#name : 'FamixTest8Entity',
	#superclass : 'MooseEntity',
	#category : 'Famix-Test8-Entities-Entities',
	#package : 'Famix-Test8-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest8Entity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest8Entity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest8Entity
]

{ #category : 'meta' }
FamixTest8Entity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTest8Model metamodel
]

{ #category : 'testing' }
FamixTest8Entity >> isAssociation [

	<ignoreForCoverage>
	<generated>
	^ false
]
