"
This is a the comment of the model class
"
Class {
	#name : #FamixTest1Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest1TEntityCreator',
	#classTraits : 'FamixTest1TEntityCreator classTrait',
	#instVars : [
		'#modelHasProperties => FMProperty'
	],
	#category : #'Famix-Test1-Entities-Model'
}

{ #category : #accessing }
FamixTest1Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest1Model class >> annotation [
	<FMClass: #FamixTest1Model super: #MooseModel>
	<package: #'Famix-Test1-Entities'>
	<generated>
]

{ #category : #testing }
FamixTest1Model class >> canBeImportedFromFile [

	"Please keep this method even if it is the same as in superclass.
	It is here to avoid generation of a method returning true"

	^ false
]

{ #category : #accessing }
FamixTest1Model class >> importingContextClass [

	<generated>
	^ FamixTest1ImportingContext
]

{ #category : #accessing }
FamixTest1Model >> modelHasProperties [

	<FMProperty: #modelHasProperties type: #Object>
	<generated>
	^ modelHasProperties
]

{ #category : #accessing }
FamixTest1Model >> modelHasProperties: anObject [
	<generated>
	modelHasProperties := anObject
]
