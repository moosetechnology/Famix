"
This is a the comment of the model class
"
Class {
	#name : #FamixTest1Model,
	#superclass : #MooseModel,
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
FamixTest1Model >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Model >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Model >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Model >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Model >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Model >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest1Model >> isType [

	<generated>
	^ false
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
