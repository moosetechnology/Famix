"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTestComposedTEntityCreator',
	#category : 'Famix-TestComposedMetamodel-Entities-Model',
	#package : 'Famix-TestComposedMetamodel-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTestComposedTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTestComposedTEntityCreator >> newAssociation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposedAssociation new
]

{ #category : 'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity1 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposedCustomEntity1 new
]

{ #category : 'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity2 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposedCustomEntity2 new
]

{ #category : 'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity3 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposedCustomEntity3 new
]

{ #category : 'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity4 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposedCustomEntity4 new
]

{ #category : 'entity creation' }
FamixTestComposedTEntityCreator >> newStandardEntity [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposedStandardEntity new
]
