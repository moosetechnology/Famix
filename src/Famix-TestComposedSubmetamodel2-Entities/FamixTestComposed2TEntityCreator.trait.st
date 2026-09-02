"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTestComposed2TEntityCreator',
	#category : 'Famix-TestComposedSubmetamodel2-Entities-Model',
	#package : 'Famix-TestComposedSubmetamodel2-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTestComposed2TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2Class new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTestComposed2Class named: aName)
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2Comment new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity1 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2CustomEntity1 new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity2 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2CustomEntity2 new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity3 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2CustomEntity3 new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity4 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2CustomEntity4 new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity5 [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2CustomEntity5 new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2Method new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTestComposed2Method named: aName)
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2SourceLanguage new
]

{ #category : 'entity creation' }
FamixTestComposed2TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTestComposed2SourceTextAnchor new
]
