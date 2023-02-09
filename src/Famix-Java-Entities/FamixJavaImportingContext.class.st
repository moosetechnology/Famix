Class {
	#name : #FamixJavaImportingContext,
	#superclass : #FmxImportingContext,
	#category : #'Famix-Java-Entities'
}

{ #category : #accessing }
FamixJavaImportingContext class >> importedMetamodel [

	<generated>
	^ FamixJavaModel metamodel
]

{ #category : #importing }
FamixJavaImportingContext >> importAccess [

	<generated>
	^ self import: #Access
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationInstance [

	<generated>
	^ self import: #AnnotationInstance
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationInstanceAttribute [

	<generated>
	^ self import: #AnnotationInstanceAttribute
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationType [

	<generated>
	^ self import: #AnnotationType
]

{ #category : #importing }
FamixJavaImportingContext >> importAnnotationTypeAttribute [

	<generated>
	^ self import: #AnnotationTypeAttribute
]

{ #category : #importing }
FamixJavaImportingContext >> importAttribute [

	<generated>
	^ self import: #Attribute
]

{ #category : #importing }
FamixJavaImportingContext >> importClass [

	<generated>
	^ self import: #Class
]

{ #category : #importing }
FamixJavaImportingContext >> importComment [

	<generated>
	^ self import: #Comment
]

{ #category : #importing }
FamixJavaImportingContext >> importContainerEntity [

	<generated>
	^ self import: #ContainerEntity
]

{ #category : #importing }
FamixJavaImportingContext >> importEntity [

	<generated>
	^ self import: #Entity
]

{ #category : #importing }
FamixJavaImportingContext >> importEnum [

	<generated>
	^ self import: #Enum
]

{ #category : #importing }
FamixJavaImportingContext >> importEnumValue [

	<generated>
	^ self import: #EnumValue
]

{ #category : #importing }
FamixJavaImportingContext >> importException [

	<generated>
	^ self import: #Exception
]

{ #category : #importing }
FamixJavaImportingContext >> importImplementation [

	<generated>
	^ self import: #Implementation
]

{ #category : #importing }
FamixJavaImportingContext >> importImplicitVariable [

	<generated>
	^ self import: #ImplicitVariable
]

{ #category : #importing }
FamixJavaImportingContext >> importImport [

	<generated>
	^ self import: #Import
]

{ #category : #importing }
FamixJavaImportingContext >> importIndexedFileAnchor [

	<generated>
	^ self import: #IndexedFileAnchor
]

{ #category : #importing }
FamixJavaImportingContext >> importInheritance [

	<generated>
	^ self import: #Inheritance
]

{ #category : #importing }
FamixJavaImportingContext >> importInterface [

	<generated>
	^ self import: #Interface
]

{ #category : #importing }
FamixJavaImportingContext >> importInvocation [

	<generated>
	^ self import: #Invocation
]

{ #category : #importing }
FamixJavaImportingContext >> importLocalVariable [

	<generated>
	^ self import: #LocalVariable
]

{ #category : #importing }
FamixJavaImportingContext >> importMethod [

	<generated>
	^ self import: #Method
]

{ #category : #importing }
FamixJavaImportingContext >> importNamedEntity [

	<generated>
	^ self import: #NamedEntity
]

{ #category : #importing }
FamixJavaImportingContext >> importPackage [

	<generated>
	^ self import: #Package
]

{ #category : #importing }
FamixJavaImportingContext >> importParameter [

	<generated>
	^ self import: #Parameter
]

{ #category : #importing }
FamixJavaImportingContext >> importParameterType [

	<generated>
	^ self import: #ParameterType
]

{ #category : #importing }
FamixJavaImportingContext >> importParameterizableClass [

	<generated>
	^ self import: #ParameterizableClass
]

{ #category : #importing }
FamixJavaImportingContext >> importParameterizableException [

	<generated>
	^ self import: #ParameterizableException
]

{ #category : #importing }
FamixJavaImportingContext >> importParameterizableInterface [

	<generated>
	^ self import: #ParameterizableInterface
]

{ #category : #importing }
FamixJavaImportingContext >> importParameterizedType [

	<generated>
	^ self import: #ParameterizedType
]

{ #category : #importing }
FamixJavaImportingContext >> importPrimitiveType [

	<generated>
	^ self import: #PrimitiveType
]

{ #category : #importing }
FamixJavaImportingContext >> importReference [

	<generated>
	^ self import: #Reference
]

{ #category : #importing }
FamixJavaImportingContext >> importSourceAnchor [

	<generated>
	^ self import: #SourceAnchor
]

{ #category : #importing }
FamixJavaImportingContext >> importSourceLanguage [

	<generated>
	^ self import: #SourceLanguage
]

{ #category : #importing }
FamixJavaImportingContext >> importSourceTextAnchor [

	<generated>
	^ self import: #SourceTextAnchor
]

{ #category : #importing }
FamixJavaImportingContext >> importSourcedEntity [

	<generated>
	^ self import: #SourcedEntity
]

{ #category : #importing }
FamixJavaImportingContext >> importType [

	<generated>
	^ self import: #Type
]

{ #category : #importing }
FamixJavaImportingContext >> importUnknownSourceLanguage [

	<generated>
	^ self import: #UnknownSourceLanguage
]

{ #category : #importing }
FamixJavaImportingContext >> importUnknownVariable [

	<generated>
	^ self import: #UnknownVariable
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
FamixJavaImportingContext >> shouldImportContainerEntity [
	<generated>
	^ self shouldImport: #ContainerEntity
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportEntity [
	<generated>
	^ self shouldImport: #Entity
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
FamixJavaImportingContext >> shouldImportNamedEntity [
	<generated>
	^ self shouldImport: #NamedEntity
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
FamixJavaImportingContext >> shouldImportParameterType [
	<generated>
	^ self shouldImport: #ParameterType
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParameterizableClass [
	<generated>
	^ self shouldImport: #ParameterizableClass
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParameterizableException [
	<generated>
	^ self shouldImport: #ParameterizableException
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParameterizableInterface [
	<generated>
	^ self shouldImport: #ParameterizableInterface
]

{ #category : #testing }
FamixJavaImportingContext >> shouldImportParameterizedType [
	<generated>
	^ self shouldImport: #ParameterizedType
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
FamixJavaImportingContext >> shouldImportSourceAnchor [
	<generated>
	^ self shouldImport: #SourceAnchor
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
FamixJavaImportingContext >> shouldImportSourcedEntity [
	<generated>
	^ self shouldImport: #SourcedEntity
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
