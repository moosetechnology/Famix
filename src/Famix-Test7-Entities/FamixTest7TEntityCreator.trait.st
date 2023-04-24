"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTest7TEntityCreator,
	#category : #'Famix-Test7-Entities-Model'
}

{ #category : #meta }
FamixTest7TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newClass [

	<generated>
	^ self add: FamixTest7Class new
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixTest7Class named: aName)
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newComment [

	<generated>
	^ self add: FamixTest7Comment new
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newInheritance [

	<generated>
	^ self add: FamixTest7Inheritance new
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newMethod [

	<generated>
	^ self add: FamixTest7Method new
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixTest7Method named: aName)
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newModel [

	<generated>
	^ self add: FamixTest7Model new
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixTest7SourceLanguage new
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixTest7SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixTest7TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixTest7UnknownSourceLanguage new
]
