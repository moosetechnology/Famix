Class {
	#name : 'FamixTest4Model',
	#superclass : 'MooseModel',
	#traits : 'FamixTest4TEntityCreator',
	#classTraits : 'FamixTest4TEntityCreator classTrait',
	#category : 'Famix-Test4-Entities-Model',
	#package : 'Famix-Test4-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest4Model class >> annotation [

	<FMClass: #Model super: #MooseModel>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^ self
]
