Class {
	#name : 'MooseMSEImporterTestModel',
	#superclass : 'MooseModel',
	#traits : 'MooseMSEImporterTestTEntityCreator',
	#classTraits : 'MooseMSEImporterTestTEntityCreator classTrait',
	#category : 'Moose-Core-Tests-Entities-Model',
	#package : 'Moose-Core-Tests-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
MooseMSEImporterTestModel class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
MooseMSEImporterTestModel class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
]
