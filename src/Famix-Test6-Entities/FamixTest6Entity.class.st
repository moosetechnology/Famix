Class {
	#name : 'FamixTest6Entity',
	#superclass : 'MooseEntity',
	#category : 'Famix-Test6-Entities-Entities',
	#package : 'Famix-Test6-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest6Entity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest6Entity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest6Entity
]

{ #category : 'meta' }
FamixTest6Entity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTest6Model metamodel
]

{ #category : 'testing' }
FamixTest6Entity >> hasImmediateSource [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest6Entity >> isComment [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest6Entity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest6Entity >> isQueryable [

	<ignoreForCoverage>
	<generated>
	^ false
]
