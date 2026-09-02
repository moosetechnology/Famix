Class {
	#name : 'FamixTestComposed3Model',
	#superclass : 'MooseModel',
	#traits : 'FamixTestComposed1TEntityCreator + FamixTestComposed2TEntityCreator + FamixTestComposed3TEntityCreator + FamixTestComposedComposedTEntityCreator + FamixTestComposedTEntityCreator',
	#classTraits : 'FamixTestComposed1TEntityCreator classTrait + FamixTestComposed2TEntityCreator classTrait + FamixTestComposed3TEntityCreator classTrait + FamixTestComposedComposedTEntityCreator classTrait + FamixTestComposedTEntityCreator classTrait',
	#category : 'Famix-TestComposed3Metamodel-Entities-Model',
	#package : 'Famix-TestComposed3Metamodel-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixTestComposed3Model class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' 'Famix-TestComposedSubmetamodel2-Entities' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedMetamodel-Entities' 'Famix-TestComposedComposedMetamodel-Entities')
]

{ #category : 'meta' }
FamixTestComposed3Model class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-TestComposed3Metamodel-Entities'>
	<generated>
]
