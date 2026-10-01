Class {
	#name : #FamixTest2Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest2TEntityCreator',
	#classTraits : 'FamixTest2TEntityCreator classTrait',
	#category : #'Famix-Test2-Entities-Model'
}

{ #category : #accessing }
FamixTest2Model class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest2Model class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-Test2-Entities'>
	<generated>
]
