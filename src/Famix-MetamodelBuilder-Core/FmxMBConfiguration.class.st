"
settings for the FamixMetamodelBuilder
"
Class {
	#name : 'FmxMBConfiguration',
	#superclass : 'Object',
	#instVars : [
		'prefix',
		'packageName',
		'packageNameForAnnotations',
		'navigationForContainers',
		'navigationForNonContainers',
		'shouldGenerateFileImportHelpers'
	],
	#category : 'Famix-MetamodelBuilder-Core-Basic',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Basic'
}

{ #category : 'initialization' }
FmxMBConfiguration >> initialize [

	super initialize.

	shouldGenerateFileImportHelpers := false.

	navigationForContainers := true.
	navigationForNonContainers := false
]

{ #category : 'accessing' }
FmxMBConfiguration >> navigationForContainers [

	"define if navigation methods for Moose Finder should be generated for containment relations"
	^ navigationForContainers
]

{ #category : 'accessing' }
FmxMBConfiguration >> navigationForContainers: anObject [
	navigationForContainers := anObject
]

{ #category : 'accessing' }
FmxMBConfiguration >> navigationForNonContainers [

	"define if navigation methods for Moose Finder should be generated for non-containment relations"

	^ navigationForNonContainers
]

{ #category : 'accessing' }
FmxMBConfiguration >> navigationForNonContainers: anObject [
	navigationForNonContainers := anObject
]

{ #category : 'accessing' }
FmxMBConfiguration >> packageName [
	^ packageName ifNil: [ packageName := #'FamixMetamodelBulder-Generated' ]
]

{ #category : 'accessing' }
FmxMBConfiguration >> packageName: anObject [
	packageName := anObject
]

{ #category : 'accessing' }
FmxMBConfiguration >> packageNameForAnnotations [
	^ packageNameForAnnotations ifNil: [ self packageName ].
]

{ #category : 'accessing' }
FmxMBConfiguration >> packageNameForAnnotations: anObject [
	packageNameForAnnotations := anObject
]

{ #category : 'accessing' }
FmxMBConfiguration >> prefix [
	^ prefix ifNil: [ prefix := '' ]
]

{ #category : 'accessing' }
FmxMBConfiguration >> prefix: anObject [
	prefix := anObject
]

{ #category : 'accessing' }
FmxMBConfiguration >> shouldGenerateFileImportHelpers [

	^ shouldGenerateFileImportHelpers
]

{ #category : 'accessing' }
FmxMBConfiguration >> shouldGenerateFileImportHelpers: aBoolean [

	shouldGenerateFileImportHelpers := aBoolean
]
