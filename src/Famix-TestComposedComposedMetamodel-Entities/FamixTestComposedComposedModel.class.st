Class {
	#name : #FamixTestComposedComposedModel,
	#superclass : #MooseModel,
	#traits : 'FamixTestComposed1TEntityCreator + FamixTestComposed2TEntityCreator + FamixTestComposedTEntityCreator',
	#classTraits : 'FamixTestComposed1TEntityCreator classTrait + FamixTestComposed2TEntityCreator classTrait + FamixTestComposedTEntityCreator classTrait',
	#category : #'Famix-TestComposedComposedMetamodel-Entities-Model'
}

{ #category : #accessing }
FamixTestComposedComposedModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' 'Famix-TestComposedSubmetamodel2-Entities' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedMetamodel-Entities')
]

{ #category : #meta }
FamixTestComposedComposedModel class >> annotation [
	<FMClass: #FamixTestComposedComposedModel super: #MooseModel>
	<package: #'Famix-TestComposedComposedMetamodel-Entities'>
	<generated>
]
