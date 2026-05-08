Class {
	#name : 'FmxMBModel',
	#superclass : 'FmxMBClass',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'settings - default' }
FmxMBModel >> defaultSuperclassName [

	^ #MooseModel
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
		generateSubmetamodelsMethod;
		generateAnnotation
]

{ #category : 'generating-methods' }
FmxMBModel >> generateAnnotation [
	"I do not know why for model we take the fullName and not the name as for other classes... This is not coherant, we should review this in a Moose metting"

	self
		addMethod: (FmxMBMethodsFactory
				 annotationFor: self fullName
				 super: self superclassName
				 package: self builder safeAnnotationPackageName
				 isAbstract: false)
		classSide: true
		protocol: #meta
]

{ #category : 'generating-methods' }
FmxMBModel >> generateFileImportMethods [

	self builder configuration shouldGenerateFileImportHelpers ifFalse: [ ^ self ].

	self addMethod: FmxMBMethodsFactory canBeImportedFromFile classSide: true protocol: #testing.

	self addMethod: (FmxMBMethodsFactory importingClassNamed: self builder importingContextName) classSide: true protocol: #accessing
]

{ #category : 'generating-methods' }
FmxMBModel >> generateSubmetamodelsMethod [

	self builder allSubBuilders ifNotEmpty: [ :subBuilders |
		self addMethod: (FmxMBMethodsFactory allSubmetamodelsPackagesNamesFor: subBuilders) classSide: true protocol: #accessing ]
]

{ #category : 'testing' }
FmxMBModel >> isModelClass [

	^ true
]

{ #category : 'accessing' }
FmxMBModel >> name [
	^ super name ifNil: [ #'Model' ]
]
