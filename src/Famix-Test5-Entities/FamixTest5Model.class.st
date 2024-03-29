Class {
	#name : #FamixTest5Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest5TEntityCreator',
	#classTraits : 'FamixTest5TEntityCreator classTrait',
	#category : #'Famix-Test5-Entities-Model'
}

{ #category : #accessing }
FamixTest5Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest5Model class >> annotation [
	<FMClass: #FamixTest5Model super: #MooseModel>
	<package: #'Famix-Test5-Entities'>
	<generated>
]
