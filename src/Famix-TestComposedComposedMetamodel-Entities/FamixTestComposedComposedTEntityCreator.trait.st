"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTestComposedComposedTEntityCreator,
	#category : #'Famix-TestComposedComposedMetamodel-Entities-Model'
}

{ #category : #meta }
FamixTestComposedComposedTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposedComposedMetamodel-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTestComposedComposedTEntityCreator >> newModel [

	<generated>
	^ self add: FamixTestComposedComposedModel new
]
