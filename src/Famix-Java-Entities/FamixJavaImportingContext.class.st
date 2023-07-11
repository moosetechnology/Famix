"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixJavaModel.
"
Class {
	#name : #FamixJavaImportingContext,
	#superclass : #FamixImportingContext,
	#category : #'Famix-Java-Entities-Import'
}

{ #category : #accessing }
FamixJavaImportingContext class >> importedMetamodel [

	<generated>
	^ FamixJavaModel metamodel
]

{ #category : #importing }
FamixJavaImportingContext >> importAccess [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Access)
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationInstance [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstance)
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationInstanceAttribute [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstanceAttribute)
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationType [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationType)
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationTypeAttribute [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationTypeAttribute)
]

{ #category : #importing }
FamixJavaImportingContext >> importAttribute [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Attribute)
]

{ #category : #importing }
FamixJavaImportingContext >> importClass [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Class)
]

{ #category : #importing }
FamixJavaImportingContext >> importComment [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : #importing }
FamixJavaImportingContext >> importConcretisation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Concretisation)
]

{ #category : #importing }
FamixJavaImportingContext >> importEnum [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Enum)
]

{ #category : #importing }
FamixJavaImportingContext >> importEnumValue [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #EnumValue)
]

{ #category : #importing }
FamixJavaImportingContext >> importException [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Exception)
]

{ #category : #importing }
FamixJavaImportingContext >> importImplementation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Implementation)
]

{ #category : #importing }
FamixJavaImportingContext >> importImplicitVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ImplicitVariable)
]

{ #category : #importing }
FamixJavaImportingContext >> importImport [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Import)
]

{ #category : #importing }
FamixJavaImportingContext >> importIndexedFileAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IndexedFileAnchor)
]

{ #category : #importing }
FamixJavaImportingContext >> importInheritance [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Inheritance)
]

{ #category : #importing }
FamixJavaImportingContext >> importInterface [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Interface)
]

{ #category : #importing }
FamixJavaImportingContext >> importInvocation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Invocation)
]

{ #category : #importing }
FamixJavaImportingContext >> importLocalVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #LocalVariable)
]

{ #category : #importing }
FamixJavaImportingContext >> importMethod [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Method)
]

{ #category : #importing }
FamixJavaImportingContext >> importPackage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Package)
]

{ #category : #importing }
FamixJavaImportingContext >> importParameter [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Parameter)
]

{ #category : #importing }
FamixJavaImportingContext >> importParameterConcretisation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #ParameterConcretisation)
]

{ #category : #importing }
FamixJavaImportingContext >> importParameterType [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParameterType)
]

{ #category : #importing }
FamixJavaImportingContext >> importParametricClass [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricClass)
]

{ #category : #importing }
FamixJavaImportingContext >> importParametricInterface [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricInterface)
]

{ #category : #importing }
FamixJavaImportingContext >> importParametricMethod [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ParametricMethod)
]

{ #category : #importing }
FamixJavaImportingContext >> importPrimitiveType [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PrimitiveType)
]

{ #category : #importing }
FamixJavaImportingContext >> importReference [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Reference)
]

{ #category : #importing }
FamixJavaImportingContext >> importSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : #importing }
FamixJavaImportingContext >> importSourceTextAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : #importing }
FamixJavaImportingContext >> importType [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Type)
]

{ #category : #importing }
FamixJavaImportingContext >> importUnknownSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownSourceLanguage)
]

{ #category : #importing }
FamixJavaImportingContext >> importUnknownVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownVariable)
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportAccess [

	<generated>
	^ self shouldImport: #Access
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportAnnotationInstance [

	<generated>
	^ self shouldImport: #AnnotationInstance
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportAnnotationInstanceAttribute [

	<generated>
	^ self shouldImport: #AnnotationInstanceAttribute
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportAnnotationType [

	<generated>
	^ self shouldImport: #AnnotationType
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportAnnotationTypeAttribute [

	<generated>
	^ self shouldImport: #AnnotationTypeAttribute
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportAttribute [

	<generated>
	^ self shouldImport: #Attribute
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportClass [

	<generated>
	^ self shouldImport: #Class
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportComment [

	<generated>
	^ self shouldImport: #Comment
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportConcretisation [

	<generated>
	^ self shouldImport: #Concretisation
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportEnum [

	<generated>
	^ self shouldImport: #Enum
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportEnumValue [

	<generated>
	^ self shouldImport: #EnumValue
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportException [

	<generated>
	^ self shouldImport: #Exception
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportImplementation [

	<generated>
	^ self shouldImport: #Implementation
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportImplicitVariable [

	<generated>
	^ self shouldImport: #ImplicitVariable
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportImport [

	<generated>
	^ self shouldImport: #Import
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportIndexedFileAnchor [

	<generated>
	^ self shouldImport: #IndexedFileAnchor
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportInheritance [

	<generated>
	^ self shouldImport: #Inheritance
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportInterface [

	<generated>
	^ self shouldImport: #Interface
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportInvocation [

	<generated>
	^ self shouldImport: #Invocation
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportLocalVariable [

	<generated>
	^ self shouldImport: #LocalVariable
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportMethod [

	<generated>
	^ self shouldImport: #Method
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportPackage [

	<generated>
	^ self shouldImport: #Package
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParameter [

	<generated>
	^ self shouldImport: #Parameter
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParameterConcretisation [

	<generated>
	^ self shouldImport: #ParameterConcretisation
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParameterType [

	<generated>
	^ self shouldImport: #ParameterType
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParametricClass [

	<generated>
	^ self shouldImport: #ParametricClass
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParametricInterface [

	<generated>
	^ self shouldImport: #ParametricInterface
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParametricMethod [

	<generated>
	^ self shouldImport: #ParametricMethod
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportPrimitiveType [

	<generated>
	^ self shouldImport: #PrimitiveType
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportReference [

	<generated>
	^ self shouldImport: #Reference
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportSourceLanguage [

	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportSourceTextAnchor [

	<generated>
	^ self shouldImport: #SourceTextAnchor
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportType [

	<generated>
	^ self shouldImport: #Type
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportUnknownSourceLanguage [

	<generated>
	^ self shouldImport: #UnknownSourceLanguage
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportUnknownVariable [

	<generated>
	^ self shouldImport: #UnknownVariable
]
