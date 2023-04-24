"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTest1TEntityCreator,
	#category : #'Famix-Test1-Entities-Traits'
}

{ #category : #meta }
FamixTest1TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newAssociation [

	<generated>
	^ self add: FamixTest1Association new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixTest1Attribute new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newAttributeNamed: aName [

	<generated>
	^ self add: (FamixTest1Attribute named: aName)
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newClass [

	<generated>
	^ self add: FamixTest1Class new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixTest1Class named: aName)
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newComment [

	<generated>
	^ self add: FamixTest1Comment new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newFile [

	<generated>
	^ self add: FamixTest1File new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newFileAnchor [

	<generated>
	^ self add: FamixTest1FileAnchor new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newFolder [

	<generated>
	^ self add: FamixTest1Folder new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newIndexedFileAnchor [

	<generated>
	^ self add: FamixTest1IndexedFileAnchor new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newMethod [

	<generated>
	^ self add: FamixTest1Method new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixTest1Method named: aName)
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newModel [

	<generated>
	^ self add: FamixTest1Model new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newMultipleFileAnchor [

	<generated>
	^ self add: FamixTest1MultipleFileAnchor new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixTest1SourceLanguage new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixTest1SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixTest1TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixTest1UnknownSourceLanguage new
]
