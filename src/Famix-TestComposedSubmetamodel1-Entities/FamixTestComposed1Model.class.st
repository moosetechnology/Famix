Class {
	#name : 'FamixTestComposed1Model',
	#superclass : 'MooseModel',
	#traits : 'FamixTestComposed1TEntityCreator',
	#classTraits : 'FamixTestComposed1TEntityCreator classTrait',
	#category : 'Famix-TestComposedSubmetamodel1-Entities-Model',
	#package : 'Famix-TestComposedSubmetamodel1-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixTestComposed1Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
FamixTestComposed1Model class >> annotation [

	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^ self
]
