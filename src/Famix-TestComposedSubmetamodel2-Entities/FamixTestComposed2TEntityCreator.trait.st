"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTestComposed2TEntityCreator,
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Model'
}

{ #category : #meta }
FamixTestComposed2TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newClass [

	<generated>
	^ self add: FamixTestComposed2Class new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newComment [

	<generated>
	^ self add: FamixTestComposed2Comment new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity1 [

	<generated>
	^ self add: FamixTestComposed2CustomEntity1 new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity2 [

	<generated>
	^ self add: FamixTestComposed2CustomEntity2 new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity3 [

	<generated>
	^ self add: FamixTestComposed2CustomEntity3 new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity4 [

	<generated>
	^ self add: FamixTestComposed2CustomEntity4 new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newCustomEntity5 [

	<generated>
	^ self add: FamixTestComposed2CustomEntity5 new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newMethod [

	<generated>
	^ self add: FamixTestComposed2Method new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newModel [

	<generated>
	^ self add: FamixTestComposed2Model new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixTestComposed2SourceLanguage new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixTestComposed2SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixTestComposed2TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixTestComposed2UnknownSourceLanguage new
]
