Class {
	#name : 'FamixStModel',
	#superclass : 'MooseModel',
	#traits : 'FamixStTEntityCreator',
	#classTraits : 'FamixStTEntityCreator classTrait',
	#category : 'Famix-PharoSmalltalk-Entities-Model',
	#package : 'Famix-PharoSmalltalk-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixStModel class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
FamixStModel class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : 'testing' }
FamixStModel class >> canBeImportedFromFile [

	<ignoreForCoverage>
	<generated>
	^true
]

{ #category : 'accessing' }
FamixStModel class >> importingContextClass [

	<ignoreForCoverage>
	<generated>
	^ FamixStImportingContext
]
