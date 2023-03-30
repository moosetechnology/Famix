"
settings for the FamixMetamodelBuilder
"
Class {
	#name : #FmxMBConfiguration,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'packageName',
		'packageNameForAnnotations',
		'classTag',
		'traitTag',
		'basicSuperclassName',
		'basicTraitName',
		'navigationForContainers',
		'navigationForNonContainers',
		'mooseModelName',
		'basicGroupSuperclassName',
		'basicModelSuperclassName',
		'modelTag',
		'shouldGenerateFileImportHelpers',
		'basicImportingContextSuperclassName'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #accessing }
FmxMBConfiguration >> basicGroupSuperclassName [

	^ basicGroupSuperclassName ifNil: [ basicGroupSuperclassName := self defaultBasicGroupSuperclassName ]
]

{ #category : #accessing }
FmxMBConfiguration >> basicGroupSuperclassName: anObject [
	basicGroupSuperclassName := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> basicImportingContextSuperclassName [

	^ basicImportingContextSuperclassName ifNil: [ 
		  basicImportingContextSuperclassName := self
			                                         defaultBasicImportingContextSuperclassName ]
]

{ #category : #accessing }
FmxMBConfiguration >> basicModelSuperclassName [

	^ basicModelSuperclassName ifNil: [ basicModelSuperclassName := self defaultBasicModelSuperclassName ]
]

{ #category : #accessing }
FmxMBConfiguration >> basicSuperclassName [

	^ basicSuperclassName ifNil: [ basicSuperclassName := self defaultBasicSuperclassName ]
]

{ #category : #accessing }
FmxMBConfiguration >> basicSuperclassName: anObject [
	basicSuperclassName := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> basicTraitName [

	^ basicTraitName ifNil: [ basicTraitName := self defaultBasicTraitName ]
]

{ #category : #accessing }
FmxMBConfiguration >> basicTraitName: anObject [
	basicTraitName := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> classTag [

	^ classTag ifNil: [ classTag := self defaultClassTag ]
]

{ #category : #accessing }
FmxMBConfiguration >> classTag: anObject [
	classTag := anObject
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultBasicGroupSuperclassName [

	^ #MooseSpecializedGroup
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultBasicImportingContextSuperclassName [

	^ #FamixImportingContext
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultBasicModelSuperclassName [

	^ #MooseModel
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultBasicSuperclassName [

	^ #MooseEntity
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultBasicTraitName [

	^ #Trait
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultClassTag [

	^ #Entities
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultModelTag [

	^ #Model
]

{ #category : #'settings - default' }
FmxMBConfiguration >> defaultTraitTag [

	^ #Traits
]

{ #category : #initialization }
FmxMBConfiguration >> initialize [

	super initialize.
	
	shouldGenerateFileImportHelpers := false.
	
	navigationForContainers := true.
	navigationForNonContainers := false.
	
	
	
]

{ #category : #accessing }
FmxMBConfiguration >> modelTag [

	^ modelTag ifNil: [ modelTag := self defaultModelTag ]
]

{ #category : #accessing }
FmxMBConfiguration >> navigationForContainers [

	"define if navigation methods for Moose Finder should be generated for containment relations"
	^ navigationForContainers
]

{ #category : #accessing }
FmxMBConfiguration >> navigationForContainers: anObject [
	navigationForContainers := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> navigationForNonContainers [

	"define if navigation methods for Moose Finder should be generated for non-containment relations"

	^ navigationForNonContainers
]

{ #category : #accessing }
FmxMBConfiguration >> navigationForNonContainers: anObject [
	navigationForNonContainers := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> packageName [
	^ packageName ifNil: [ packageName := #'FamixMetamodelBulder-Generated' ]
]

{ #category : #accessing }
FmxMBConfiguration >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> packageNameForAnnotations [
	^ packageNameForAnnotations ifNil: [ self packageName ].
]

{ #category : #accessing }
FmxMBConfiguration >> packageNameForAnnotations: anObject [
	packageNameForAnnotations := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> prefix [
	^ prefix ifNil: [ prefix := '' ]
]

{ #category : #accessing }
FmxMBConfiguration >> prefix: anObject [
	prefix := anObject
]

{ #category : #accessing }
FmxMBConfiguration >> shouldGenerateFileImportHelpers [

	^ shouldGenerateFileImportHelpers
]

{ #category : #accessing }
FmxMBConfiguration >> shouldGenerateFileImportHelpers: aBoolean [

	shouldGenerateFileImportHelpers := aBoolean
]

{ #category : #accessing }
FmxMBConfiguration >> traitTag [

	^ traitTag ifNil: [ traitTag := self defaultTraitTag ]
]

{ #category : #accessing }
FmxMBConfiguration >> traitTag: anObject [
	traitTag := anObject
]
