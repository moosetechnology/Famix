"
FmxMBImportingContext is the class responsible for the generation of a subclass of `FamixImportingContext` for each metamodel.

This importing context is generated when specified in the metamodel generator with #withFileImport, as follows: 

```
newBuilder

	^ super newBuilder
		  withFileImport;
		  yourself
```
"
Class {
	#name : 'FmxMBImportingContext',
	#superclass : 'FmxMBBehavior',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visiting' }
FmxMBImportingContext >> acceptVisitor: aVisitor [

	^ aVisitor visitImportingContext: self
]

{ #category : 'accessing' }
FmxMBImportingContext >> classGeneralization [

	^ self builder environment basicImportingContextSuperclass
]

{ #category : 'accessing' }
FmxMBImportingContext >> comment [

	^ 'This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a {1}Model.' 
		  format: { self builder configuration prefix }
]

{ #category : 'settings - default' }
FmxMBImportingContext >> defaultSuperclass [

	^ self builder environment basicImportingContextSuperclass
]

{ #category : 'generating' }
FmxMBImportingContext >> generate [

	| aClass superclass |

	superclass := self classGeneralization
		              ifNil: [ self defaultSuperclassName ]
		              ifNotNil: #name.

	aClass := self builder environment
		          createClassNamed: self fullName asSymbol
		          superclass: superclass
		          traitDefinitions: self allTraitDefinitions
		          traitNames: self allTraitNames
		          precedingTrait: (self additionalProperties at: #precedingTrait ifAbsent: [ nil ])
		          properties: (self properties select: #producesSlot)
		          in: self packageName
		          tag: self tag
		          comment: self comment.

	self realClass: aClass.

	self generateImportingContextMetamodel.
	self generateShouldImport.
	self generateImport
]

{ #category : 'generating-methods' }
FmxMBImportingContext >> generateImport [

	self builder classes do: [ :each | "No need to generate methods for model and groups."
			(each isModelClass or: [ each isMetamodelClassGroup or: [ each isAbstractClass ] ]) ifFalse: [ "Associations and other entities are managed differently by the importing context"
					each allTransitiveTraits
						detect: [ :trait | trait name = #TAssociation ]
						ifFound: [ self generateImportAssociation: each ]
						ifNone: [ self generateImportConcreteEntity: each ] ] ]
]

{ #category : 'generating-methods' }
FmxMBImportingContext >> generateImportAssociation: aFmxMBAssociationClass [

	self
		addMethod: ('import{1}

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #{1})' format: { aFmxMBAssociationClass name })
		protocol: #importing
]

{ #category : 'generating-methods' }
FmxMBImportingContext >> generateImportConcreteEntity: aFmxMBClass [

	self
		addMethod: ('import{1}

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #{1})' format: { aFmxMBClass name })
		protocol: #importing
]

{ #category : 'generating-methods' }
FmxMBImportingContext >> generateImportingContextMetamodel [

	self
		addMethod: ('importedMetamodel

	<generated>
	^ {1}Model metamodel' format: { self prefix })
		classSide: true
		protocol: #accessing
]

{ #category : 'generating-methods' }
FmxMBImportingContext >> generateShouldImport [

	self builder classes do: [ :each | "No need to generate methods for model and groups."
			(each isModelClass or: [ each isMetamodelClassGroup or: [ each isAbstractClass ] ]) ifFalse: [
					self
						addMethod: ('shouldImport{1}

	<generated>
	^ self shouldImport: #{1}' format: { each name })
						protocol: #testing ] ]
]

{ #category : 'accessing' }
FmxMBImportingContext >> name [

	^ 'ImportingContext'
]
