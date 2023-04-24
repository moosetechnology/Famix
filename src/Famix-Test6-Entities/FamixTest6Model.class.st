Class {
	#name : #FamixTest6Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest6TEntityCreator',
	#classTraits : 'FamixTest6TEntityCreator classTrait',
	#category : #'Famix-Test6-Entities-Model'
}

{ #category : #accessing }
FamixTest6Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest6Model class >> annotation [
	<FMClass: #FamixTest6Model super: #MooseModel>
	<package: #'Famix-Test6-Entities'>
	<generated>
]
