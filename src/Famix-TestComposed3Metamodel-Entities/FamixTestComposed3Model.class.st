Class {
	#name : #FamixTestComposed3Model,
	#superclass : #MooseModel,
	#traits : 'FamixTestComposed1TEntityCreator + FamixTestComposed2TEntityCreator + FamixTestComposed3TEntityCreator + FamixTestComposedTEntityCreator',
	#classTraits : 'FamixTestComposed1TEntityCreator classTrait + FamixTestComposed2TEntityCreator classTrait + FamixTestComposed3TEntityCreator classTrait + FamixTestComposedTEntityCreator classTrait',
	#category : #'Famix-TestComposed3Metamodel-Entities-Model'
}

{ #category : #accessing }
FamixTestComposed3Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' 'Famix-TestComposedSubmetamodel2-Entities' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedMetamodel-Entities' 'Famix-TestComposedComposedMetamodel-Entities')
]

{ #category : #meta }
FamixTestComposed3Model class >> annotation [
	<FMClass: #FamixTestComposed3Model super: #MooseModel>
	<package: #'Famix-TestComposed3Metamodel-Entities'>
	<generated>
]
