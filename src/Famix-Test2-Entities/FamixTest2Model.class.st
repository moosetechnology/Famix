Class {
	#name : #FamixTest2Model,
	#superclass : #MooseModel,
	#traits : 'FamixTest2TEntityCreator',
	#classTraits : 'FamixTest2TEntityCreator classTrait',
	#category : #'Famix-Test2-Entities-Model'
}

{ #category : #accessing }
FamixTest2Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTest2Model class >> annotation [
	<FMClass: #FamixTest2Model super: #MooseModel>
	<package: #'Famix-Test2-Entities'>
	<generated>
]
