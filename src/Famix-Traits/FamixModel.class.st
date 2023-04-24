Class {
	#name : #FamixModel,
	#superclass : #MooseModel,
	#traits : 'FamixTEntityCreator',
	#classTraits : 'FamixTEntityCreator classTrait',
	#category : #'Famix-Traits-Model'
}

{ #category : #accessing }
FamixModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query')
]

{ #category : #meta }
FamixModel class >> annotation [
	<FMClass: #FamixModel super: #MooseModel>
	<package: #'Famix-Traits'>
	<generated>
]
