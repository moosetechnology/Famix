"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixStModel.


"
Class {
	#name : 'FamixStImportingContext',
	#superclass : 'FamixImportingContext',
	#category : 'Famix-PharoSmalltalk-Entities-Import',
	#package : 'Famix-PharoSmalltalk-Entities',
	#tag : 'Import'
}

{ #category : 'accessing' }
FamixStImportingContext class >> importedMetamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixStModel metamodel
]

{ #category : 'importing' }
FamixStImportingContext >> importAccess [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Access)
]

{ #category : 'importing' }
FamixStImportingContext >> importAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstance)
]

{ #category : 'importing' }
FamixStImportingContext >> importAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstanceAttribute)
]

{ #category : 'importing' }
FamixStImportingContext >> importAnnotationType [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationType)
]

{ #category : 'importing' }
FamixStImportingContext >> importAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationTypeAttribute)
]

{ #category : 'importing' }
FamixStImportingContext >> importAttribute [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Attribute)
]

{ #category : 'importing' }
FamixStImportingContext >> importClass [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Class)
]

{ #category : 'importing' }
FamixStImportingContext >> importComment [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : 'importing' }
FamixStImportingContext >> importEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #EntityTyping)
]

{ #category : 'importing' }
FamixStImportingContext >> importGlobalVariable [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #GlobalVariable)
]

{ #category : 'importing' }
FamixStImportingContext >> importImplicitVariable [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ImplicitVariable)
]

{ #category : 'importing' }
FamixStImportingContext >> importInheritance [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Inheritance)
]

{ #category : 'importing' }
FamixStImportingContext >> importInvocation [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Invocation)
]

{ #category : 'importing' }
FamixStImportingContext >> importLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #LocalVariable)
]

{ #category : 'importing' }
FamixStImportingContext >> importMethod [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Method)
]

{ #category : 'importing' }
FamixStImportingContext >> importNamespace [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Namespace)
]

{ #category : 'importing' }
FamixStImportingContext >> importPackage [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Package)
]

{ #category : 'importing' }
FamixStImportingContext >> importParameter [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Parameter)
]

{ #category : 'importing' }
FamixStImportingContext >> importPharoEntitySourceAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PharoEntitySourceAnchor)
]

{ #category : 'importing' }
FamixStImportingContext >> importReference [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Reference)
]

{ #category : 'importing' }
FamixStImportingContext >> importSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : 'importing' }
FamixStImportingContext >> importSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : 'importing' }
FamixStImportingContext >> importUnknownVariable [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownVariable)
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportAccess [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Access
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationInstance
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationInstanceAttribute
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportAnnotationType [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationType
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationTypeAttribute
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportAttribute [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Attribute
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportClass [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Class
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportComment [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Comment
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #EntityTyping
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportGlobalVariable [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #GlobalVariable
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportImplicitVariable [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ImplicitVariable
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportInheritance [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Inheritance
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportInvocation [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Invocation
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #LocalVariable
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportMethod [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Method
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportNamespace [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Namespace
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportPackage [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Package
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportParameter [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Parameter
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportPharoEntitySourceAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #PharoEntitySourceAnchor
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportReference [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Reference
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #SourceTextAnchor
]

{ #category : 'testing' }
FamixStImportingContext >> shouldImportUnknownVariable [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #UnknownVariable
]
