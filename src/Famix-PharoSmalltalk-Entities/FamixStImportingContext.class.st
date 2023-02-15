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
	^ self importAssociation: (self class fm3ClassNamed: #Access)
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationInstance [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstance)
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationInstanceAttribute [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationInstanceAttribute)
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationType [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationType)
]

{ #category : #importing }
FamixStImportingContext >> importAnnotationTypeAttribute [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #AnnotationTypeAttribute)
]

{ #category : #importing }
FamixStImportingContext >> importAttribute [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Attribute)
]

{ #category : #importing }
FamixStImportingContext >> importClass [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Class)
]

{ #category : #importing }
FamixStImportingContext >> importComment [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : #importing }
FamixStImportingContext >> importEntity [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Entity)
]

{ #category : #importing }
FamixStImportingContext >> importGlobalVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #GlobalVariable)
]

{ #category : #importing }
FamixStImportingContext >> importImplicitVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ImplicitVariable)
]

{ #category : #importing }
FamixStImportingContext >> importInheritance [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Inheritance)
]

{ #category : #importing }
FamixStImportingContext >> importInvocation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Invocation)
]

{ #category : #importing }
FamixStImportingContext >> importLocalVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #LocalVariable)
]

{ #category : #importing }
FamixStImportingContext >> importMethod [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Method)
]

{ #category : #importing }
FamixStImportingContext >> importNamedEntity [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #NamedEntity)
]

{ #category : #importing }
FamixStImportingContext >> importNamespace [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Namespace)
]

{ #category : #importing }
FamixStImportingContext >> importPackage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Package)
]

{ #category : #importing }
FamixStImportingContext >> importParameter [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Parameter)
]

{ #category : #importing }
FamixStImportingContext >> importPharoEntitySourceAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PharoEntitySourceAnchor)
]

{ #category : #importing }
FamixStImportingContext >> importReference [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Reference)
]

{ #category : #importing }
FamixStImportingContext >> importSourceAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceAnchor)
]

{ #category : #importing }
FamixStImportingContext >> importSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : #importing }
FamixStImportingContext >> importSourceTextAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : #importing }
FamixStImportingContext >> importSourcedEntity [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourcedEntity)
]

{ #category : #importing }
FamixStImportingContext >> importUnknownSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownSourceLanguage)
]

{ #category : #importing }
FamixStImportingContext >> importUnknownVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownVariable)
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAccess [

	<generated>
	^ self shouldImport: #Access
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationInstance [

	<generated>
	^ self shouldImport: #AnnotationInstance
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationInstanceAttribute [

	<generated>
	^ self shouldImport: #AnnotationInstanceAttribute
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationType [

	<generated>
	^ self shouldImport: #AnnotationType
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAnnotationTypeAttribute [

	<generated>
	^ self shouldImport: #AnnotationTypeAttribute
]

{ #category : #testing }
FamixStImportingContext >> shouldImportAttribute [

	<generated>
	^ self shouldImport: #Attribute
]

{ #category : #testing }
FamixStImportingContext >> shouldImportClass [

	<generated>
	^ self shouldImport: #Class
]

{ #category : #testing }
FamixStImportingContext >> shouldImportComment [

	<generated>
	^ self shouldImport: #Comment
]

{ #category : #testing }
FamixStImportingContext >> shouldImportEntity [

	<generated>
	^ self shouldImport: #Entity
]

{ #category : #testing }
FamixStImportingContext >> shouldImportGlobalVariable [

	<generated>
	^ self shouldImport: #GlobalVariable
]

{ #category : #testing }
FamixStImportingContext >> shouldImportImplicitVariable [

	<generated>
	^ self shouldImport: #ImplicitVariable
]

{ #category : #testing }
FamixStImportingContext >> shouldImportInheritance [

	<generated>
	^ self shouldImport: #Inheritance
]

{ #category : #testing }
FamixStImportingContext >> shouldImportInvocation [

	<generated>
	^ self shouldImport: #Invocation
]

{ #category : #testing }
FamixStImportingContext >> shouldImportLocalVariable [

	<generated>
	^ self shouldImport: #LocalVariable
]

{ #category : #testing }
FamixStImportingContext >> shouldImportMethod [

	<generated>
	^ self shouldImport: #Method
]

{ #category : #testing }
FamixStImportingContext >> shouldImportNamedEntity [

	<generated>
	^ self shouldImport: #NamedEntity
]

{ #category : #testing }
FamixStImportingContext >> shouldImportNamespace [

	<generated>
	^ self shouldImport: #Namespace
]

{ #category : #testing }
FamixStImportingContext >> shouldImportPackage [

	<generated>
	^ self shouldImport: #Package
]

{ #category : #testing }
FamixStImportingContext >> shouldImportParameter [

	<generated>
	^ self shouldImport: #Parameter
]

{ #category : #testing }
FamixStImportingContext >> shouldImportPharoEntitySourceAnchor [

	<generated>
	^ self shouldImport: #PharoEntitySourceAnchor
]

{ #category : #testing }
FamixStImportingContext >> shouldImportReference [

	<generated>
	^ self shouldImport: #Reference
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourceAnchor [

	<generated>
	^ self shouldImport: #SourceAnchor
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourceLanguage [

	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourceTextAnchor [

	<generated>
	^ self shouldImport: #SourceTextAnchor
]

{ #category : #testing }
FamixStImportingContext >> shouldImportSourcedEntity [

	<generated>
	^ self shouldImport: #SourcedEntity
]

{ #category : #testing }
FamixStImportingContext >> shouldImportUnknownSourceLanguage [

	<generated>
	^ self shouldImport: #UnknownSourceLanguage
]

{ #category : #testing }
FamixStImportingContext >> shouldImportUnknownVariable [

	<generated>
	^ self shouldImport: #UnknownVariable
]
