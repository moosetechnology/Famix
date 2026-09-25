Class {
	#name : 'FamixTest2Entity',
	#superclass : 'MooseEntity',
	#category : 'Famix-Test2-Entities-Entities',
	#package : 'Famix-Test2-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest2Entity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest2Entity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest2Entity
]

{ #category : 'meta' }
FamixTest2Entity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTest2Model metamodel
]

{ #category : 'testing' }
FamixTest2Entity >> canBeStub [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> hasImmediateSource [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> isAssociation [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> isClass [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> isComment [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> isInheritance [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> isQueryable [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixTest2Entity >> isType [

	<ignoreForCoverage>
	<generated>
	^ false
]
