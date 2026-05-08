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
	#superclass : 'FmxMBClass',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visiting' }
FmxMBImportingContext >> acceptVisitor: aVisitor [

	^ aVisitor visitImportingContext: self
]

{ #category : 'accessing' }
FmxMBImportingContext >> comment [

	^ 'This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a {1}Model.' format: { self builder configuration prefix }
]

{ #category : 'accessing' }
FmxMBImportingContext >> defaultSuperclassName [

	^ #FamixImportingContext
]

{ #category : 'generating' }
FmxMBImportingContext >> generate [

	super generate.

	self addMethod: (FmxMBMethodsFactory importedMetamodelForPrefix: self prefix) classSide: true protocol: #accessing.

	self builder concreteClasses do: [ :each |
			self
				addMethod: (each allTransitiveTraits
						 detect: [ :trait | trait name = #TAssociation ]
						 ifFound: [ FmxMBMethodsFactory importAssociationNamed: each name ]
						 ifNone: [ FmxMBMethodsFactory importEntityNamed: each name ])
				protocol: #importing.

			self addMethod: (FmxMBMethodsFactory shouldImportNamed: each name) protocol: #testing ]
]

{ #category : 'accessing' }
FmxMBImportingContext >> name [

	^ super name ifNil:[ 'ImportingContext']
]
