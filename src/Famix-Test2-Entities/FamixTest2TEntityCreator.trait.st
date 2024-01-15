"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #FamixTest2TEntityCreator,
	#category : #'Famix-Test2-Entities-Model'
}

{ #category : #meta }
FamixTest2TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest2TEntityCreator >> newClass [

	<generated>
	^ self add: FamixTest2Class new
]

{ #category : #'entity creation' }
FamixTest2TEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixTest2Class named: aName)
]

{ #category : #'entity creation' }
FamixTest2TEntityCreator >> newComment [

	<generated>
	^ self add: FamixTest2Comment new
]

{ #category : #'entity creation' }
FamixTest2TEntityCreator >> newInheritance [

	<generated>
	^ self add: FamixTest2Inheritance new
]

{ #category : #'entity creation' }
FamixTest2TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixTest2SourceLanguage new
]

{ #category : #'entity creation' }
FamixTest2TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixTest2SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixTest2TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixTest2UnknownSourceLanguage new
]
