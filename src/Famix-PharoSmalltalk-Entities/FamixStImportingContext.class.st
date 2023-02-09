Class {
	#name : #FamixStImportingContext,
	#superclass : #FmxImportingContext,
	#category : #'Famix-PharoSmalltalk-Entities'
}

{ #category : #accessing }
FamixStImportingContext class >> importedMetamodel [

	<generated>
	^ FamixStModel metamodel
]

{ #category : #importing }
FamixStImportingContext >> importAccess [

	<generated>
	^ self import: #Access
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationInstance [

	<generated>
	^ self import: #AnnotationInstance
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationInstanceAttribute [

	<generated>
	^ self import: #AnnotationInstanceAttribute
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationType [

	<generated>
	^ self import: #AnnotationType
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationTypeAttribute [

	<generated>
	^ self import: #AnnotationTypeAttribute
]

{ #category : #importing }
FamixStImportingContext >> importAttribute [

	<generated>
	^ self import: #Attribute
]

{ #category : #importing }
FamixStImportingContext >> importClass [

	<generated>
	^ self import: #Class
]

{ #category : #importing }
FamixStImportingContext >> importComment [

	<generated>
	^ self import: #Comment
]

{ #category : #importing }
FamixStImportingContext >> importEntity [

	<generated>
	^ self import: #Entity
]

{ #category : #importing }
FamixStImportingContext >> importGlobalVariable [

	<generated>
	^ self import: #GlobalVariable
]

{ #category : #importing }
FamixStImportingContext >> importImplicitVariable [

	<generated>
	^ self import: #ImplicitVariable
]

{ #category : #importing }
FamixStImportingContext >> importInheritance [

	<generated>
	^ self import: #Inheritance
]

{ #category : #importing }
FamixStImportingContext >> importInvocation [

	<generated>
	^ self import: #Invocation
]

{ #category : #importing }
FamixStImportingContext >> importLocalVariable [

	<generated>
	^ self import: #LocalVariable
]

{ #category : #importing }
FamixStImportingContext >> importMethod [

	<generated>
	^ self import: #Method
]

{ #category : #importing }
FamixStImportingContext >> importNamedEntity [

	<generated>
	^ self import: #NamedEntity
]

{ #category : #importing }
FamixStImportingContext >> importNamespace [

	<generated>
	^ self import: #Namespace
]

{ #category : #importing }
FamixStImportingContext >> importPackage [

	<generated>
	^ self import: #Package
]

{ #category : #importing }
FamixStImportingContext >> importParameter [

	<generated>
	^ self import: #Parameter
]

{ #category : #importing }
FamixStImportingContext >> importPharoEntitySourceAnchor [

	<generated>
	^ self import: #PharoEntitySourceAnchor
]

{ #category : #importing }
FamixStImportingContext >> importReference [

	<generated>
	^ self import: #Reference
]

{ #category : #importing }
FamixStImportingContext >> importSourceAnchor [

	<generated>
	^ self import: #SourceAnchor
]

{ #category : #importing }
FamixStImportingContext >> importSourceLanguage [

	<generated>
	^ self import: #SourceLanguage
]

{ #category : #importing }
FamixStImportingContext >> importSourceTextAnchor [

	<generated>
	^ self import: #SourceTextAnchor
]

{ #category : #importing }
FamixStImportingContext >> importSourcedEntity [

	<generated>
	^ self import: #SourcedEntity
]

{ #category : #importing }
FamixStImportingContext >> importUnknownSourceLanguage [

	<generated>
	^ self import: #UnknownSourceLanguage
]

{ #category : #importing }
FamixStImportingContext >> importUnknownVariable [

	<generated>
	^ self import: #UnknownVariable
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAccess [
	<generated>
	^ self shouldImport: FamixStAccess
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationInstance [
	<generated>
	^ self shouldImport: FamixStAnnotationInstance
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationInstanceAttribute [
	<generated>
	^ self shouldImport: FamixStAnnotationInstanceAttribute
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationType [
	<generated>
	^ self shouldImport: FamixStAnnotationType
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationTypeAttribute [
	<generated>
	^ self shouldImport: FamixStAnnotationTypeAttribute
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAttribute [
	<generated>
	^ self shouldImport: FamixStAttribute
]

{ #category : #testing }
FamixStImportingContext >> shouldImportClass [
	<generated>
	^ self shouldImport: FamixStClass
]

{ #category : #testing }
FamixStImportingContext >> shouldImportComment [
	<generated>
	^ self shouldImport: FamixStComment
]

{ #category : #testing }
FamixStImportingContext >> shouldImportEntity [
	<generated>
	^ self shouldImport: FamixStEntity
]

{ #category : #testing }
FamixStImportingContext >> shouldImportGlobalVariable [
	<generated>
	^ self shouldImport: FamixStGlobalVariable
]

{ #category : #testing }
FamixStImportingContext >> shouldImportImplicitVariable [
	<generated>
	^ self shouldImport: FamixStImplicitVariable
]

{ #category : #testing }
FamixStImportingContext >> shouldImportInheritance [
	<generated>
	^ self shouldImport: FamixStInheritance
]

{ #category : #testing }
FamixStImportingContext >> shouldImportInvocation [
	<generated>
	^ self shouldImport: FamixStInvocation
]

{ #category : #testing }
FamixStImportingContext >> shouldImportLocalVariable [
	<generated>
	^ self shouldImport: FamixStLocalVariable
]

{ #category : #testing }
FamixStImportingContext >> shouldImportMethod [
	<generated>
	^ self shouldImport: FamixStMethod
]

{ #category : #testing }
FamixStImportingContext >> shouldImportNamedEntity [
	<generated>
	^ self shouldImport: FamixStNamedEntity
]

{ #category : #testing }
FamixStImportingContext >> shouldImportNamespace [
	<generated>
	^ self shouldImport: FamixStNamespace
]

{ #category : #testing }
FamixStImportingContext >> shouldImportPackage [
	<generated>
	^ self shouldImport: FamixStPackage
]

{ #category : #testing }
FamixStImportingContext >> shouldImportParameter [
	<generated>
	^ self shouldImport: FamixStParameter
]

{ #category : #testing }
FamixStImportingContext >> shouldImportPharoEntitySourceAnchor [
	<generated>
	^ self shouldImport: FamixStPharoEntitySourceAnchor
]

{ #category : #testing }
FamixStImportingContext >> shouldImportReference [
	<generated>
	^ self shouldImport: FamixStReference
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourceAnchor [
	<generated>
	^ self shouldImport: FamixStSourceAnchor
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourceLanguage [
	<generated>
	^ self shouldImport: FamixStSourceLanguage
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourceTextAnchor [
	<generated>
	^ self shouldImport: FamixStSourceTextAnchor
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourcedEntity [
	<generated>
	^ self shouldImport: FamixStSourcedEntity
]

{ #category : #testing }
FamixStImportingContext >> shouldImportUnknownSourceLanguage [
	<generated>
	^ self shouldImport: FamixStUnknownSourceLanguage
]

{ #category : #testing }
FamixStImportingContext >> shouldImportUnknownVariable [
	<generated>
	^ self shouldImport: FamixStUnknownVariable
]
