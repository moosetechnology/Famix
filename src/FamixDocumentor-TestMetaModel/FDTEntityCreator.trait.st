"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FDTEntityCreator',
	#category : 'FamixDocumentor-TestMetaModel-Model',
	#package : 'FamixDocumentor-TestMetaModel',
	#tag : 'Model'
}

{ #category : 'meta' }
FDTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
]

{ #category : 'entity creation' }
FDTEntityCreator >> newClass1 [

	<ignoreForCoverage>
	<generated>
	^ self add: FDClass1 new
]

{ #category : 'entity creation' }
FDTEntityCreator >> newClass2 [

	<ignoreForCoverage>
	<generated>
	^ self add: FDClass2 new
]
