"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTest3TEntityCreator,
	#category : #'Famix-Test3-Entities-Model'
}

{ #category : #meta }
FamixTest3TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
