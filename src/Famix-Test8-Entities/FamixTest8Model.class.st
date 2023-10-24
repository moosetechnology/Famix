Class {
	#name : #FamixTest8Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest8TEntityCreator',
	#classTraits : 'FamixTest8TEntityCreator classTrait',
	#category : #'Famix-Test8-Entities-Model'
}

{ #category : #accessing }
FamixTest8Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest8Model class >> annotation [
	<FMClass: #FamixTest8Model super: #MooseModel>
	<package: #'Famix-Test8-Entities'>
	<generated>
]
