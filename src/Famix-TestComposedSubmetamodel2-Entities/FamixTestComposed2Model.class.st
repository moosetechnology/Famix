Class {
	#name : 'FamixTestComposed2Model',
	#superclass : 'MooseModel',
	#traits : 'FamixTestComposed2TEntityCreator',
	#classTraits : 'FamixTestComposed2TEntityCreator classTrait',
	#category : 'Famix-TestComposedSubmetamodel2-Entities-Model',
	#package : 'Famix-TestComposedSubmetamodel2-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixTestComposed2Model class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
FamixTestComposed2Model class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
]
