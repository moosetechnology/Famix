"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTEntityCreator,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTEntityCreator >> newModel [

	<generated>
	^ self add: FamixModel new
]
