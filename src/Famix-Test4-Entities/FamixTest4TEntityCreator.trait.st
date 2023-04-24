"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTest4TEntityCreator,
	#category : #'Famix-Test4-Entities-Traits'
}

{ #category : #meta }
FamixTest4TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^ self
]
