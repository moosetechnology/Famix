"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixTest5TEntityCreator,
	#category : #'Famix-Test5-Entities-Model'
}

{ #category : #meta }
FamixTest5TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest5TEntityCreator >> newAnnotationType1 [

	<generated>
	^ self add: FamixTest5AnnotationType1 new
]

{ #category : #'entity creation' }
FamixTest5TEntityCreator >> newAnnotationType2 [

	<generated>
	^ self add: FamixTest5AnnotationType2 new
]

{ #category : #'entity creation' }
FamixTest5TEntityCreator >> newWithAnnotationType1 [

	<generated>
	^ self add: FamixTest5WithAnnotationType1 new
]

{ #category : #'entity creation' }
FamixTest5TEntityCreator >> newWithAnnotationType2 [

	<generated>
	^ self add: FamixTest5WithAnnotationType2 new
]
