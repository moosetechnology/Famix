Class {
	#name : #FamixTest7Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest7TEntityCreator',
	#classTraits : 'FamixTest7TEntityCreator classTrait',
	#category : #'Famix-Test7-Entities-Model'
}

{ #category : #accessing }
FamixTest7Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest7Model class >> annotation [
	<FMClass: #FamixTest7Model super: #MooseModel>
	<package: #'Famix-Test7-Entities'>
	<generated>
]
