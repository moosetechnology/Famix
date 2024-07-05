"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #FamixTestComposedTEntityCreator,
	#category : #'Famix-TestComposedMetamodel-Entities-Model'
}

{ #category : #meta }
FamixTestComposedTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTestComposedTEntityCreator >> newAssociation [

	<generated>
	^ self add: FamixTestComposedAssociation new
]

{ #category : #'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity1 [

	<generated>
	^ self add: FamixTestComposedCustomEntity1 new
]

{ #category : #'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity2 [

	<generated>
	^ self add: FamixTestComposedCustomEntity2 new
]

{ #category : #'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity3 [

	<generated>
	^ self add: FamixTestComposedCustomEntity3 new
]

{ #category : #'entity creation' }
FamixTestComposedTEntityCreator >> newCustomEntity4 [

	<generated>
	^ self add: FamixTestComposedCustomEntity4 new
]

{ #category : #'entity creation' }
FamixTestComposedTEntityCreator >> newStandardEntity [

	<generated>
	^ self add: FamixTestComposedStandardEntity new
]
