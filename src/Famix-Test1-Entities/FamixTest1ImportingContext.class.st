"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixTest1Model.


"
Class {
	#name : 'FamixTest1ImportingContext',
	#superclass : 'FamixImportingContext',
	#category : 'Famix-Test1-Entities-Import',
	#package : 'Famix-Test1-Entities',
	#tag : 'Import'
}

{ #category : 'accessing' }
FamixTest1ImportingContext class >> importedMetamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixTest1Model metamodel
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importAssociation [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Association)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importAttribute [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Attribute)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importBytesFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #BytesFileAnchor)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importClass [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Class)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importComment [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importFile [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #File)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #FileAnchor)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importFolder [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Folder)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IndexedFileAnchor)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importMethod [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Method)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importMultipleFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #MultipleFileAnchor)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : 'importing' }
FamixTest1ImportingContext >> importSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportAssociation [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Association
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportAttribute [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Attribute
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportBytesFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #BytesFileAnchor
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportClass [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Class
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportComment [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Comment
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportFile [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #File
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #FileAnchor
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportFolder [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Folder
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #IndexedFileAnchor
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportMethod [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Method
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportMultipleFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #MultipleFileAnchor
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : 'testing' }
FamixTest1ImportingContext >> shouldImportSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #SourceTextAnchor
]
