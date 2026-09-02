"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest1TEntityCreator',
	#category : 'Famix-Test1-Entities-Traits',
	#package : 'Famix-Test1-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixTest1TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test1-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newAssociation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1Association new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1Attribute new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest1Attribute named: aName)
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newBytesFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1BytesFileAnchor new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1Class new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest1Class named: aName)
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1Comment new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newFile [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1File new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1FileAnchor new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newFileNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest1File named: aName)
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newFolder [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1Folder new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newFolderNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest1Folder named: aName)
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1IndexedFileAnchor new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1Method new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest1Method named: aName)
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newMultipleFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1MultipleFileAnchor new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1SourceLanguage new
]

{ #category : 'entity creation' }
FamixTest1TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest1SourceTextAnchor new
]
