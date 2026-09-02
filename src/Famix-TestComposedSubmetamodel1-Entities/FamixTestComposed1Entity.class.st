Class {
	#name : 'FamixTestComposed1Entity',
	#superclass : 'MooseEntity',
	#category : 'Famix-TestComposedSubmetamodel1-Entities-Entities',
	#package : 'Famix-TestComposedSubmetamodel1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposed1Entity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTestComposed1Entity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTestComposed1Entity
]

{ #category : 'meta' }
FamixTestComposed1Entity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTestComposed1Model metamodel
]

{ #category : 'testing' }
FamixTestComposed1Entity >> canBeStub [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> hasImmediateSource [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isBehavioural [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isClass [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isComment [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isMethod [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isQueryable [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isType [

	<ignoreForCoverage>
	<generated>
	^ false
]
