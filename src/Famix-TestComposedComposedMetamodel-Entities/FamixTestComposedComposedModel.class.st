Class {
	#name : 'FamixTestComposedComposedModel',
	#superclass : 'MooseModel',
	#traits : 'FamixTestComposed1TEntityCreator + FamixTestComposed2TEntityCreator + FamixTestComposedComposedTEntityCreator + FamixTestComposedTEntityCreator',
	#classTraits : 'FamixTestComposed1TEntityCreator classTrait + FamixTestComposed2TEntityCreator classTrait + FamixTestComposedComposedTEntityCreator classTrait + FamixTestComposedTEntityCreator classTrait',
	#category : 'Famix-TestComposedComposedMetamodel-Entities-Model',
	#package : 'Famix-TestComposedComposedMetamodel-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixTestComposedComposedModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' 'Famix-TestComposedSubmetamodel2-Entities' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedMetamodel-Entities')
]

{ #category : 'meta' }
FamixTestComposedComposedModel class >> annotation [

	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-TestComposedComposedMetamodel-Entities'>
	<generated>
	^ self
]
