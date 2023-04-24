"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTestComposed3TEntityCreator,
	#category : #'Famix-TestComposed3Metamodel-Entities-Model'
}

{ #category : #meta }
FamixTestComposed3TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposed3Metamodel-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTestComposed3TEntityCreator >> newModel [

	<generated>
	^ self add: FamixTestComposed3Model new
]
