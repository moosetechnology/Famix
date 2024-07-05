Class {
	#name : #FamixStModel,
	#superclass : #MooseModel,
	#traits : 'FamixStTEntityCreator',
	#classTraits : 'FamixStTEntityCreator classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Model'
}

{ #category : #accessing }
FamixStModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixStModel class >> annotation [
	<FMClass: #FamixStModel super: #MooseModel>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : #testing }
FamixStModel class >> canBeImportedFromFile [
	<generated>
	^true
]

{ #category : #accessing }
FamixStModel class >> importingContextClass [

	<generated>
	^ FamixStImportingContext
]
