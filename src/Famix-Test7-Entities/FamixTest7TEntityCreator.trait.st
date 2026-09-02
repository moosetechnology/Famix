"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest7TEntityCreator',
	#category : 'Famix-Test7-Entities-Model',
	#package : 'Famix-Test7-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest7TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test7-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest7Class new
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest7Class named: aName)
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest7Comment new
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newInheritance [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest7Inheritance new
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest7Method new
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest7Method named: aName)
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest7SourceLanguage new
]

{ #category : 'entity creation' }
FamixTest7TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest7SourceTextAnchor new
]
