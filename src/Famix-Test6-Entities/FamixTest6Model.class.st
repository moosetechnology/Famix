Class {
	#name : 'FamixTest6Model',
	#superclass : 'MooseModel',
	#traits : 'FamixTest6TEntityCreator',
	#classTraits : 'FamixTest6TEntityCreator classTrait',
	#category : 'Famix-Test6-Entities-Model',
	#package : 'Famix-Test6-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixTest6Model class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
FamixTest6Model class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-Test6-Entities'>
	<generated>
]
