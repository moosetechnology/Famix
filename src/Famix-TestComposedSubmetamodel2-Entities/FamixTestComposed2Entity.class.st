Class {
	#name : 'FamixTestComposed2Entity',
	#superclass : 'MooseEntity',
	#category : 'Famix-TestComposedSubmetamodel2-Entities-Entities',
	#package : 'Famix-TestComposedSubmetamodel2-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposed2Entity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTestComposed2Entity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTestComposed2Entity
]

{ #category : 'meta' }
FamixTestComposed2Entity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTestComposed2Model metamodel
]

{ #category : 'testing' }
FamixTestComposed2Entity >> canBeStub [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> hasImmediateSource [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> isBehavioural [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> isClass [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> isComment [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> isMethod [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> isQueryable [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed2Entity >> isType [

	<ignoreForCoverage>
	<generated>
	^ false
]
