Class {
	#name : #FamixTest3Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest3TEntityCreator',
	#classTraits : 'FamixTest3TEntityCreator classTrait',
	#category : #'Famix-Test3-Entities-Model'
}

{ #category : #accessing }
FamixTest3Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest3Model class >> annotation [
	<FMClass: #FamixTest3Model super: #MooseModel>
	<package: #'Famix-Test3-Entities'>
	<generated>
]
