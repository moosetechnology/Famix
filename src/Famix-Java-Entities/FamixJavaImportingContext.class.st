"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixJavaModel.


"
Class {
	#name : 'FamixJavaImportingContext',
	#superclass : 'FamixImportingContext',
	#category : 'Famix-Java-Entities-Import',
	#package : 'Famix-Java-Entities',
	#tag : 'Import'
}

{ #category : 'accessing' }
FamixJavaImportingContext class >> importedMetamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixJavaModel metamodel
]

{ #category : 'importing' }
FamixJavaImportingContext >> importAccess [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Access)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstance)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstanceAttribute)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importAnnotationType [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationType)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationTypeAttribute)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importAttribute [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Attribute)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importClass [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Class)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importComment [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importConcretization [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Concretization)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #EntityTyping)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importEnum [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Enum)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importEnumValue [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #EnumValue)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importException [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Exception)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importImplementation [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Implementation)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importImplicitVariable [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ImplicitVariable)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importImport [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Import)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IndexedFileAnchor)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importInheritance [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Inheritance)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importInitializer [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Initializer)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importInterface [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Interface)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importInvocation [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Invocation)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #LocalVariable)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importMethod [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Method)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importPackage [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Package)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParameter [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Parameter)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricClass [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricClass)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricEntityTyping)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricImplementation [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricImplementation)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricInheritance [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricInheritance)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricInterface [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricInterface)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricInvocation [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricInvocation)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricMethod [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricMethod)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importParametricReference [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricReference)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importPrimitiveType [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PrimitiveType)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importReference [

	<ignoreForCoverage>
	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Reference)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importType [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Type)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importTypeParameter [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #TypeParameter)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importUnknownVariable [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownVariable)
]

{ #category : 'importing' }
FamixJavaImportingContext >> importWildcard [

	<ignoreForCoverage>
	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Wildcard)
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportAccess [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Access
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationInstance
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationInstanceAttribute
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportAnnotationType [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationType
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #AnnotationTypeAttribute
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportAttribute [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Attribute
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportClass [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Class
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportComment [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Comment
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportConcretization [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Concretization
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #EntityTyping
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportEnum [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Enum
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportEnumValue [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #EnumValue
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportException [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Exception
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportImplementation [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Implementation
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportImplicitVariable [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ImplicitVariable
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportImport [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Import
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #IndexedFileAnchor
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportInheritance [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Inheritance
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportInitializer [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Initializer
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportInterface [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Interface
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportInvocation [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Invocation
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #LocalVariable
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportMethod [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Method
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportPackage [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Package
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParameter [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Parameter
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricClass [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricClass
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricEntityTyping
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricImplementation [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricImplementation
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricInheritance [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricInheritance
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricInterface [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricInterface
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricInvocation [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricInvocation
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricMethod [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricMethod
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportParametricReference [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #ParametricReference
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportPrimitiveType [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #PrimitiveType
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportReference [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Reference
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #SourceTextAnchor
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportType [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Type
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportTypeParameter [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #TypeParameter
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportUnknownVariable [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #UnknownVariable
]

{ #category : 'testing' }
FamixJavaImportingContext >> shouldImportWildcard [

	<ignoreForCoverage>
	<generated>
	^ self shouldImport: #Wildcard
]
