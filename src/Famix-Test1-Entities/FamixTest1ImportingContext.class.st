Class {
	#name : #FamixTest1ImportingContext,
	#superclass : #FamixImportingContext,
	#category : #'Famix-Test1-Entities-Import'
}

{ #category : #accessing }
FamixTest1ImportingContext class >> importedMetamodel [

	<generated>
	^ FamixTest1Model metamodel
]

{ #category : #importing }
FamixTest1ImportingContext >> importAssociation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Association)
]

{ #category : #importing }
FamixTest1ImportingContext >> importAttribute [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Attribute)
]

{ #category : #importing }
FamixTest1ImportingContext >> importClass [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Class)
]

{ #category : #importing }
FamixTest1ImportingContext >> importComment [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : #importing }
FamixTest1ImportingContext >> importFile [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #File)
]

{ #category : #importing }
FamixTest1ImportingContext >> importFileAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #FileAnchor)
]

{ #category : #importing }
FamixTest1ImportingContext >> importFolder [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Folder)
]

{ #category : #importing }
FamixTest1ImportingContext >> importIndexedFileAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IndexedFileAnchor)
]

{ #category : #importing }
FamixTest1ImportingContext >> importMethod [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Method)
]

{ #category : #importing }
FamixTest1ImportingContext >> importMultipleFileAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #MultipleFileAnchor)
]

{ #category : #importing }
FamixTest1ImportingContext >> importSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : #importing }
FamixTest1ImportingContext >> importSourceTextAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : #importing }
FamixTest1ImportingContext >> importUnknownSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownSourceLanguage)
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportAssociation [

	<generated>
	^ self shouldImport: #Association
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportAttribute [

	<generated>
	^ self shouldImport: #Attribute
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportClass [

	<generated>
	^ self shouldImport: #Class
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportComment [

	<generated>
	^ self shouldImport: #Comment
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportFile [

	<generated>
	^ self shouldImport: #File
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportFileAnchor [

	<generated>
	^ self shouldImport: #FileAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportFolder [

	<generated>
	^ self shouldImport: #Folder
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportIndexedFileAnchor [

	<generated>
	^ self shouldImport: #IndexedFileAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportMethod [

	<generated>
	^ self shouldImport: #Method
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportMultipleFileAnchor [

	<generated>
	^ self shouldImport: #MultipleFileAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportSourceLanguage [

	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportSourceTextAnchor [

	<generated>
	^ self shouldImport: #SourceTextAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportUnknownSourceLanguage [

	<generated>
	^ self shouldImport: #UnknownSourceLanguage
]
