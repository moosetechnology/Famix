"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #FamixTestComposed1TEntityCreator,
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Model'
}

{ #category : #meta }
FamixTestComposed1TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newClass [

	<generated>
	^ self add: FamixTestComposed1Class new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixTestComposed1Class named: aName)
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newComment [

	<generated>
	^ self add: FamixTestComposed1Comment new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity1 [

	<generated>
	^ self add: FamixTestComposed1CustomEntity1 new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity2 [

	<generated>
	^ self add: FamixTestComposed1CustomEntity2 new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity3 [

	<generated>
	^ self add: FamixTestComposed1CustomEntity3 new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity4 [

	<generated>
	^ self add: FamixTestComposed1CustomEntity4 new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newCustomEntity5 [

	<generated>
	^ self add: FamixTestComposed1CustomEntity5 new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newMethod [

	<generated>
	^ self add: FamixTestComposed1Method new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixTestComposed1Method named: aName)
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixTestComposed1SourceLanguage new
]

{ #category : #'entity creation' }
FamixTestComposed1TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixTestComposed1SourceTextAnchor new
]
