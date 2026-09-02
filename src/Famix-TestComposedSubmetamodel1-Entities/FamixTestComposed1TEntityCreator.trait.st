"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTestComposed1TEntityCreator',
	#category : 'Famix-TestComposedSubmetamodel1-Entities-Model',
	#package : 'Famix-TestComposedSubmetamodel1-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTestComposed1TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1Class new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTestComposed1Class named: aName)
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1Comment new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity1 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1CustomEntity1 new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity2 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1CustomEntity2 new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity3 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1CustomEntity3 new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity4 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1CustomEntity4 new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity5 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1CustomEntity5 new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1Method new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTestComposed1Method named: aName)
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1SourceLanguage new
]

{ #category : 'entity creation' }
FamixTestComposed1TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed1SourceTextAnchor new
]
