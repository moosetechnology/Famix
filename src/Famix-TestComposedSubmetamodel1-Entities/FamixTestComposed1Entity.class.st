Class {
	#name : 'FamixTestComposed1Entity',
	#superclass : 'MooseEntity',
	#category : 'Famix-TestComposedSubmetamodel1-Entities-Entities',
	#package : 'Famix-TestComposedSubmetamodel1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposed1Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTestComposed1Entity class >> isAbstract [

	<generated>
	^ self == FamixTestComposed1Entity
]

{ #category : 'meta' }
FamixTestComposed1Entity class >> metamodel [

	<generated>
	^ FamixTestComposed1Model metamodel
]

{ #category : 'testing' }
FamixTestComposed1Entity >> canBeStub [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> hasImmediateSource [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isBehavioural [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isClass [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isComment [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isMethod [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixTestComposed1Entity >> isType [

	<generated>
	^ false
]
