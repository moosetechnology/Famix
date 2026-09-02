"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest6TEntityCreator',
	#category : 'Famix-Test6-Entities-Model',
	#package : 'Famix-Test6-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest6TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test6-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest6TEntityCreator >> newBacon [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest6Bacon new
]

{ #category : 'entity creation' }
FamixTest6TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest6Comment new
]

{ #category : 'entity creation' }
FamixTest6TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest6SourceLanguage new
]

{ #category : 'entity creation' }
FamixTest6TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest6SourceTextAnchor new
]

{ #category : 'entity creation' }
FamixTest6TEntityCreator >> newSpam [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest6Spam new
]
