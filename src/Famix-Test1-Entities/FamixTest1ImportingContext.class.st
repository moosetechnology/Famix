Class {
	#name : #FamixTest1ImportingContext,
	#superclass : #FmxImportingContext,
	#category : #'Famix-Test1-Entities'
}

{ #category : #accessing }
FamixTest1ImportingContext class >> importedMetamodel [

	<generated>
	^ FamixTest1Model metamodel
]

{ #category : #importing }
FamixTest1ImportingContext >> importAssociation [

	<generated>
	^ self import: #Association
]

{ #category : #importing }
FamixTest1ImportingContext >> importAttribute [

	<generated>
	^ self import: #Attribute
]

{ #category : #importing }
FamixTest1ImportingContext >> importClass [

	<generated>
	^ self import: #Class
]

{ #category : #importing }
FamixTest1ImportingContext >> importComment [

	<generated>
	^ self import: #Comment
]

{ #category : #importing }
FamixTest1ImportingContext >> importEntity [

	<generated>
	^ self import: #Entity
]

{ #category : #importing }
FamixTest1ImportingContext >> importFile [

	<generated>
	^ self import: #File
]

{ #category : #importing }
FamixTest1ImportingContext >> importFileAnchor [

	<generated>
	^ self import: #FileAnchor
]

{ #category : #importing }
FamixTest1ImportingContext >> importFolder [

	<generated>
	^ self import: #Folder
]

{ #category : #importing }
FamixTest1ImportingContext >> importIndexedFileAnchor [

	<generated>
	^ self import: #IndexedFileAnchor
]

{ #category : #importing }
FamixTest1ImportingContext >> importMethod [

	<generated>
	^ self import: #Method
]

{ #category : #importing }
FamixTest1ImportingContext >> importMultipleFileAnchor [

	<generated>
	^ self import: #MultipleFileAnchor
]

{ #category : #importing }
FamixTest1ImportingContext >> importNamedEntity [

	<generated>
	^ self import: #NamedEntity
]

{ #category : #importing }
FamixTest1ImportingContext >> importSourceAnchor [

	<generated>
	^ self import: #SourceAnchor
]

{ #category : #importing }
FamixTest1ImportingContext >> importSourceLanguage [

	<generated>
	^ self import: #SourceLanguage
]

{ #category : #importing }
FamixTest1ImportingContext >> importSourceTextAnchor [

	<generated>
	^ self import: #SourceTextAnchor
]

{ #category : #importing }
FamixTest1ImportingContext >> importSourcedEntity [

	<generated>
	^ self import: #SourcedEntity
]

{ #category : #importing }
FamixTest1ImportingContext >> importUnknownSourceLanguage [

	<generated>
	^ self import: #UnknownSourceLanguage
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportAssociation [
	<generated>
	^ self shouldImport: FamixTest1Association
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportAttribute [
	<generated>
	^ self shouldImport: FamixTest1Attribute
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportClass [
	<generated>
	^ self shouldImport: FamixTest1Class
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportComment [
	<generated>
	^ self shouldImport: FamixTest1Comment
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportEntity [
	<generated>
	^ self shouldImport: FamixTest1Entity
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportFile [
	<generated>
	^ self shouldImport: FamixTest1File
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportFileAnchor [
	<generated>
	^ self shouldImport: FamixTest1FileAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportFolder [
	<generated>
	^ self shouldImport: FamixTest1Folder
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportIndexedFileAnchor [
	<generated>
	^ self shouldImport: FamixTest1IndexedFileAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportMethod [
	<generated>
	^ self shouldImport: FamixTest1Method
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportMultipleFileAnchor [
	<generated>
	^ self shouldImport: FamixTest1MultipleFileAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportNamedEntity [
	<generated>
	^ self shouldImport: FamixTest1NamedEntity
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportSourceAnchor [
	<generated>
	^ self shouldImport: FamixTest1SourceAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportSourceLanguage [
	<generated>
	^ self shouldImport: FamixTest1SourceLanguage
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportSourceTextAnchor [
	<generated>
	^ self shouldImport: FamixTest1SourceTextAnchor
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportSourcedEntity [
	<generated>
	^ self shouldImport: FamixTest1SourcedEntity
]

{ #category : #testing }
FamixTest1ImportingContext >> shouldImportUnknownSourceLanguage [
	<generated>
	^ self shouldImport: FamixTest1UnknownSourceLanguage
]
