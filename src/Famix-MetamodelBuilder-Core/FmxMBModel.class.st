Class {
	#name : #FmxMBModel,
	#superclass : #FmxMBClass,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #'settings - default' }
FmxMBModel >> defaultSuperclass [
	^ self builder environment basicModelSuperclass
]

{ #category : #'settings - default' }
FmxMBModel >> defaultTag [
	^ self builder configuration modelTag
]

{ #category : #'settings - default' }
FmxMBModel >> generate [
	super generate.
	self generateModelMethods: self ensureRealClass
]

{ #category : #'settings - default' }
FmxMBModel >> generateModelMethods: aModelClass [
	aModelClass classSide
		compile:
			('annotation
	<FMClass: #{1} super: #MooseModel>
	<package: {2}>
	<generated>' format: {self fullName . self builder safeAnnotationPackageName})
		classified: 'meta'.

	self builder isImportedFromFile ifTrue: [ 
	aModelClass classSide
		compile: 'canBeImportedFromFile
	<generated>
	^true' 
	classified: 'testing'.	
	].
		
	self builder allSubBuilders
		ifNotEmpty: [ :subBuilders | 
			aModelClass classSide
				compile:
					('allSubmetamodelsPackagesNames
	<generated>
	^ #({1})'
						format:
							{(String
								streamContents: [ :stream | 
									| packages |
									packages := (subBuilders collect: [ :subBuilder | subBuilder configuration packageName ]) asOrderedCollection.
									packages sort: #yourself descending.
									packages do: [ :package | stream print: package ] separatedBy: [ stream space ] ])})
				classified: 'accessing' ]
]

{ #category : #'settings - default' }
FmxMBModel >> generateRootMetamodelMethodIn: aClass [
	"no need to define the method #metamodel in the #Model entity
	because it is already the #Model entity that hold the metamodel"
]

{ #category : #'settings - default' }
FmxMBModel >> generateTestingMethodsIn: aClass [
	"no need to define the testing methods in the #Model entity
	because we already have a test that check that the entity is a Model"
]

{ #category : #testing }
FmxMBModel >> isModelClass [
	"The class prefix, Model"
	^ true
]

{ #category : #testing }
FmxMBModel >> name [
	^ super name ifNil: [ #'Model' ]
]
