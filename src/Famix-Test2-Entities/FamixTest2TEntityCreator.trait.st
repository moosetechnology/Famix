"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest2TEntityCreator',
	#category : 'Famix-Test2-Entities-Model',
	#package : 'Famix-Test2-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest2TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test2-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Class new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2Class named: aName)
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Comment new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newInheritance [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Inheritance new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2SourceLanguage new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2SourceTextAnchor new
]
