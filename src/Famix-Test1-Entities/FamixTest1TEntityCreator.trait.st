"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTest1TEntityCreator,
	#category : #'Famix-Test1-Entities-Traits'
}

{ #category : #meta }
FamixTest1TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
