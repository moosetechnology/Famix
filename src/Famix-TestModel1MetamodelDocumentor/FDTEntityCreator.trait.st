"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FDTEntityCreator,
	#category : #'Famix-TestModel1MetamodelDocumentor-Model'
}

{ #category : #meta }
FDTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestModel1MetamodelDocumentor'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FDTEntityCreator >> newModel [

	<generated>
	^ self add: FDModel new
]
