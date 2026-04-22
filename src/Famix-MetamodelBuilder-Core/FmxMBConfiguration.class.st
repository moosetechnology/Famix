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
		'shouldGenerateFileImportHelpers'
	],
	#category : 'Famix-MetamodelBuilder-Core-Basic',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Basic'
}

{ #category : 'initialization' }
FmxMBConfiguration >> initialize [

	super initialize.

	shouldGenerateFileImportHelpers := false
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
