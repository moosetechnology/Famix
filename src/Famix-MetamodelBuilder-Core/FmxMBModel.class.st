Class {
	#name : 'FmxMBModel',
	#superclass : 'FmxMBClass',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'settings - default' }
FmxMBModel >> defaultSuperclass [
	^ self builder environment basicModelSuperclass
]

{ #category : 'settings - default' }
FmxMBModel >> defaultTag [

	^ #Model
]

{ #category : 'generating' }
FmxMBModel >> generate [

	super generate.
	self
		generateFileImportMethods;
		generateSubmetamodelsMethod
]

{ #category : 'generating-methods' }
FmxMBModel >> generateAnnotation [

	self
		addMethod: ('annotation
	<FMClass: #{1} super: #MooseModel>
	<package: {2}>
	<generated>' format: {
					 self fullName.
					 self builder safeAnnotationPackageName })
		classSide: true
		protocol: #meta
]

{ #category : 'generating-methods' }
FmxMBModel >> generateFileImportMethods [

	self builder configuration shouldGenerateFileImportHelpers ifFalse: [ ^ self ].

	self
		addMethod: 'canBeImportedFromFile
	<generated>
	^true'
		classSide: true
		protocol: #testing.

	self
		addMethod: ('importingContextClass

	<generated>
	^ {1}' format: { self builder importingContextName })
		classSide: true
		protocol: #accessing
]

{ #category : 'generating-methods' }
FmxMBModel >> generateMetamodelMethod [

	"no need to define the method #metamodel in the #Model entity
	because it is already the #Model entity that hold the metamodel"

	
]

{ #category : 'generating-methods' }
FmxMBModel >> generateSubmetamodelsMethod [

	self builder allSubBuilders ifNotEmpty: [ :subBuilders |
			| code |
			code := String streamContents: [ :stream |
					        | packages |
					        stream nextPutAll: 'allSubmetamodelsPackagesNames
	<generated>
	^ #('.

					        packages := (subBuilders collect: [ :subBuilder | subBuilder configuration packageName ]) asOrderedCollection sorted: #yourself descending.
					        packages do: [ :package | stream print: package ] separatedBy: [ stream space ].

					        stream nextPut: $) ].

			self addMethod: code classSide: true protocol: #accessing ]
]

{ #category : 'generating-methods' }
FmxMBModel >> generateTestingMethods [

	"No need to define the testing methods in the #Model entity
	because we already have a test that check that the entity is a Model"

	
]

{ #category : 'testing' }
FmxMBModel >> isModelClass [

	^ true
]

{ #category : 'accessing' }
FmxMBModel >> name [
	^ super name ifNil: [ #'Model' ]
]
