Class {
	#name : 'FmxMBModel',
	#superclass : 'FmxMBClass',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBModel >> acceptVisitor: aVisitor [

	^ aVisitor visitModel: self
]

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
		generateAnnotation.

	self builder allSubBuilders ifNotEmpty: [ :subBuilders |
		self addMethod: (FmxMBMethodsFactory allSubmetamodelsPackagesNamesFor: subBuilders) classSide: true protocol: #accessing ]
]

{ #category : 'generating-methods' }
FmxMBModel >> generateFileImportMethods [

	self builder configuration shouldGenerateFileImportHelpers ifFalse: [ ^ self ].

	self addMethod: FmxMBMethodsFactory canBeImportedFromFile classSide: true protocol: #testing.

	self addMethod: (FmxMBMethodsFactory importingClassNamed: self builder importingContextName) classSide: true protocol: #accessing
]

{ #category : 'testing' }
FmxMBModel >> isModelClass [

	^ true
]

{ #category : 'accessing' }
FmxMBModel >> name [
	^ super name ifNil: [ #'Model' ]
]
