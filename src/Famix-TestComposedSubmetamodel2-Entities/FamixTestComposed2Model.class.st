Class {
	#name : #FamixTestComposed2Model,
	#superclass : #MooseModel,
	#traits : 'FamixTestComposed2TEntityCreator',
	#classTraits : 'FamixTestComposed2TEntityCreator classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Model'
}

{ #category : #accessing }
FamixTestComposed2Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixTestComposed2Model class >> annotation [
	<FMClass: #FamixTestComposed2Model super: #MooseModel>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
]
