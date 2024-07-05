"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #FDTEntityCreator,
	#category : #'FamixDocumentor-TestMetaModel-Model'
}

{ #category : #meta }
FDTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FDTEntityCreator >> newClass1 [

	<generated>
	^ self add: FDClass1 new
]

{ #category : #'entity creation' }
FDTEntityCreator >> newClass2 [

	<generated>
	^ self add: FDClass2 new
]
