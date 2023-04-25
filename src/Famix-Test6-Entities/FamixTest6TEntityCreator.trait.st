"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixTest6TEntityCreator,
	#category : #'Famix-Test6-Entities-Model'
}

{ #category : #meta }
FamixTest6TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest6TEntityCreator >> newBacon [

	<generated>
	^ self add: FamixTest6Bacon new
]

{ #category : #'entity creation' }
FamixTest6TEntityCreator >> newComment [

	<generated>
	^ self add: FamixTest6Comment new
]

{ #category : #'entity creation' }
FamixTest6TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixTest6SourceLanguage new
]

{ #category : #'entity creation' }
FamixTest6TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixTest6SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixTest6TEntityCreator >> newSpam [

	<generated>
	^ self add: FamixTest6Spam new
]

{ #category : #'entity creation' }
FamixTest6TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixTest6UnknownSourceLanguage new
]
