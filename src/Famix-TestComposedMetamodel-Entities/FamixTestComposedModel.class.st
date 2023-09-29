Class {
	#name : #FamixTestComposedModel,
	#superclass : #MooseModel,
	#traits : 'FamixTestComposed1TEntityCreator + FamixTestComposed2TEntityCreator + FamixTestComposedTEntityCreator',
	#classTraits : 'FamixTestComposed1TEntityCreator classTrait + FamixTestComposed2TEntityCreator classTrait + FamixTestComposedTEntityCreator classTrait',
	#category : #'Famix-TestComposedMetamodel-Entities-Model'
}

{ #category : #accessing }
FamixTestComposedModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' 'Famix-TestComposedSubmetamodel2-Entities' 'Famix-TestComposedSubmetamodel1-Entities')
]

{ #category : #meta }
FamixTestComposedModel class >> annotation [
	<FMClass: #FamixTestComposedModel super: #MooseModel>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
]
